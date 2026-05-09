; DESCRIPTION: Places a white line segment connecting (485, 42) to (451, 236).
; PLAN: r0=485(x1), r1=42(y1), r2=451(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 42
LDI r2, 451
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
