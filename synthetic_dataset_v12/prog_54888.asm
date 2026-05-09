; DESCRIPTION: Renders a white line between points (457, 154) and (197, 57).
; PLAN: r0=457(x1), r1=154(y1), r2=197(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 154
LDI r2, 197
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
