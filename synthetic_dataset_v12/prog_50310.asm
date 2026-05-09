; DESCRIPTION: Draws a white line from (485, 25) to (364, 171).
; PLAN: r0=485(x1), r1=25(y1), r2=364(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 25
LDI r2, 364
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
