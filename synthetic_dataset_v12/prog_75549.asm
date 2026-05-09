; DESCRIPTION: Renders a magenta box of size 36x44 starting at (239, 23).
; PLAN: r0=239(x), r1=23(y), r2=36(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 23
LDI r2, 36
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
