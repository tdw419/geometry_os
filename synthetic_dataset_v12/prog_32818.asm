; DESCRIPTION: Renders a magenta box of size 13x70 starting at (223, 4).
; PLAN: r0=223(x), r1=4(y), r2=13(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 4
LDI r2, 13
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
