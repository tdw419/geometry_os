; DESCRIPTION: Renders a yellow line between points (49, 239) and (120, 164).
; PLAN: r0=49(x1), r1=239(y1), r2=120(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 239
LDI r2, 120
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
