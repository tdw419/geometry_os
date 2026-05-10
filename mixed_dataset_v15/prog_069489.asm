; DESCRIPTION: Draws a orange line from (298, 39) to (365, 115).
; PLAN: r0=298(x1), r1=39(y1), r2=365(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 39
LDI r2, 365
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
