; DESCRIPTION: Renders a magenta box of size 47x88 starting at (40, 128).
; PLAN: r0=40(x), r1=128(y), r2=47(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 128
LDI r2, 47
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
