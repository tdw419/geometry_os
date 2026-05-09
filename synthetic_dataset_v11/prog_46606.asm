; DESCRIPTION: Renders a magenta box of size 16x19 starting at (183, 153).
; PLAN: r0=183(x), r1=153(y), r2=16(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 153
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
