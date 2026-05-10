; DESCRIPTION: Renders a magenta box of size 20x69 starting at (239, 33).
; PLAN: r0=239(x), r1=33(y), r2=20(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 33
LDI r2, 20
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
