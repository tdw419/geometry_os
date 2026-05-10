; DESCRIPTION: Renders a red box of size 90x104 starting at (229, 63).
; PLAN: r0=229(x), r1=63(y), r2=90(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 63
LDI r2, 90
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
