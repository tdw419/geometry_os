; DESCRIPTION: Draws a black line from (333, 52) to (298, 123).
; PLAN: r0=333(x1), r1=52(y1), r2=298(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 52
LDI r2, 298
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
