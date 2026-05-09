; DESCRIPTION: Renders a magenta box of size 11x44 starting at (269, 3).
; PLAN: r0=269(x), r1=3(y), r2=11(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 3
LDI r2, 11
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
