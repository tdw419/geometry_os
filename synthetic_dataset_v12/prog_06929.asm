; DESCRIPTION: Renders a magenta box of size 74x32 starting at (413, 211).
; PLAN: r0=413(x), r1=211(y), r2=74(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 211
LDI r2, 74
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
