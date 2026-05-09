; DESCRIPTION: Renders a magenta box of size 73x12 starting at (344, 15).
; PLAN: r0=344(x), r1=15(y), r2=73(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 15
LDI r2, 73
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
