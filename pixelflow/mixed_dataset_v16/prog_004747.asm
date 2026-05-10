; DESCRIPTION: Renders a blue box of size 70x21 starting at (174, 229).
; PLAN: r0=174(x), r1=229(y), r2=70(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 229
LDI r2, 70
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
