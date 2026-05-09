; DESCRIPTION: Draws a white line from (264, 231) to (485, 240).
; PLAN: r0=264(x1), r1=231(y1), r2=485(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 231
LDI r2, 485
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
