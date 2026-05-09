; DESCRIPTION: Renders a magenta box of size 13x117 starting at (324, 133).
; PLAN: r0=324(x), r1=133(y), r2=13(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 133
LDI r2, 13
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
