; DESCRIPTION: Renders a blue box of size 42x27 starting at (104, 189).
; PLAN: r0=104(x), r1=189(y), r2=42(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 189
LDI r2, 42
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
