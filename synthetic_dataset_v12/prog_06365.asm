; DESCRIPTION: Renders a magenta box of size 84x81 starting at (346, 6).
; PLAN: r0=346(x), r1=6(y), r2=84(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 6
LDI r2, 84
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
