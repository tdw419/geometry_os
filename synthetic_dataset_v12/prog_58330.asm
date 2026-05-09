; DESCRIPTION: Renders a cyan line between points (291, 222) and (134, 20).
; PLAN: r0=291(x1), r1=222(y1), r2=134(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 222
LDI r2, 134
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
