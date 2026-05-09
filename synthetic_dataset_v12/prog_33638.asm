; DESCRIPTION: Draws a orange line from (295, 214) to (46, 173).
; PLAN: r0=295(x1), r1=214(y1), r2=46(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 214
LDI r2, 46
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
