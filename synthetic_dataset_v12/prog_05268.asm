; DESCRIPTION: Renders a magenta box of size 114x65 starting at (32, 166).
; PLAN: r0=32(x), r1=166(y), r2=114(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 166
LDI r2, 114
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
