; DESCRIPTION: Places a black line segment connecting (467, 128) to (485, 154).
; PLAN: r0=467(x1), r1=128(y1), r2=485(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 128
LDI r2, 485
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
