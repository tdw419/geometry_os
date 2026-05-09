; DESCRIPTION: Renders a blue box of size 42x92 starting at (104, 0).
; PLAN: r0=104(x), r1=0(y), r2=42(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 0
LDI r2, 42
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
