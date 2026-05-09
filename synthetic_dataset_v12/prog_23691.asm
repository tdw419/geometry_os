; DESCRIPTION: Composite: Places a orange line segment connecting (89, 56) to (400, 170) then Sets a single red pixel at (168, 45) then Renders a cyan box of size 79x27 starting at (63, 78).
; PLAN: r0=89(x1), r1=56(y1), r2=400(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=45(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=78(y), r12=79(width), r13=27(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 56
LDI r2, 400
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 45
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 63
LDI r11, 78
LDI r12, 79
LDI r13, 27
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
