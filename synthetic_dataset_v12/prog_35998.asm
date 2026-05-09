; DESCRIPTION: Renders a white line between points (228, 126) and (160, 204).
; PLAN: r0=228(x1), r1=126(y1), r2=160(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 126
LDI r2, 160
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
