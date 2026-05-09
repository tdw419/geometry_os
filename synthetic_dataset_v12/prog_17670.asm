; DESCRIPTION: Renders a magenta box of size 73x75 starting at (173, 159).
; PLAN: r0=173(x), r1=159(y), r2=73(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 159
LDI r2, 73
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
