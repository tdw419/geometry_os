; DESCRIPTION: Draws a white line from (485, 95) to (482, 231).
; PLAN: r0=485(x1), r1=95(y1), r2=482(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 95
LDI r2, 482
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
