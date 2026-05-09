; DESCRIPTION: Draws a orange line from (106, 173) to (298, 249).
; PLAN: r0=106(x1), r1=173(y1), r2=298(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 173
LDI r2, 298
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
