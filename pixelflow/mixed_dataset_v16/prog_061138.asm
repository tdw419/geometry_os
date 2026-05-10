; DESCRIPTION: Draws a orange line from (298, 199) to (48, 10).
; PLAN: r0=298(x1), r1=199(y1), r2=48(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 199
LDI r2, 48
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
