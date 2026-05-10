; DESCRIPTION: Draws a yellow line from (485, 72) to (433, 16).
; PLAN: r0=485(x1), r1=72(y1), r2=433(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 72
LDI r2, 433
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
