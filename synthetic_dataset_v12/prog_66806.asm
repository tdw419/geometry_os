; DESCRIPTION: Draws a orange line from (193, 35) to (295, 174).
; PLAN: r0=193(x1), r1=35(y1), r2=295(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 35
LDI r2, 295
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
