; DESCRIPTION: Renders a white line between points (213, 245) and (156, 38).
; PLAN: r0=213(x1), r1=245(y1), r2=156(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 245
LDI r2, 156
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
