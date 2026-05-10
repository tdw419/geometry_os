; DESCRIPTION: Renders a black line between points (209, 96) and (258, 33).
; PLAN: r0=209(x1), r1=96(y1), r2=258(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 96
LDI r2, 258
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
