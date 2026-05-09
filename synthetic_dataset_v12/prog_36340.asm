; DESCRIPTION: Renders a magenta box of size 108x87 starting at (157, 73).
; PLAN: r0=157(x), r1=73(y), r2=108(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 73
LDI r2, 108
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
