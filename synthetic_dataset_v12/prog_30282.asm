; DESCRIPTION: Renders a blue box of size 79x103 starting at (229, 148).
; PLAN: r0=229(x), r1=148(y), r2=79(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 148
LDI r2, 79
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
