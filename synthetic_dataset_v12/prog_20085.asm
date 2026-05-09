; DESCRIPTION: Renders a blue line between points (52, 205) and (346, 66).
; PLAN: r0=52(x1), r1=205(y1), r2=346(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 205
LDI r2, 346
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
