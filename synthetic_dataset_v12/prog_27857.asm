; DESCRIPTION: Renders a magenta box of size 105x64 starting at (159, 173).
; PLAN: r0=159(x), r1=173(y), r2=105(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 173
LDI r2, 105
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
