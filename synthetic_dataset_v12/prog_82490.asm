; DESCRIPTION: Renders a magenta box of size 24x26 starting at (57, 218).
; PLAN: r0=57(x), r1=218(y), r2=24(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 218
LDI r2, 24
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
