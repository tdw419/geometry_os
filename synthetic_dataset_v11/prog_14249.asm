; DESCRIPTION: Renders a magenta box of size 110x64 starting at (53, 3).
; PLAN: r0=53(x), r1=3(y), r2=110(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 3
LDI r2, 110
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
