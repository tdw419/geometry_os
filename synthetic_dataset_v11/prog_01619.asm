; DESCRIPTION: Renders a magenta box of size 84x13 starting at (117, 40).
; PLAN: r0=117(x), r1=40(y), r2=84(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 40
LDI r2, 84
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
