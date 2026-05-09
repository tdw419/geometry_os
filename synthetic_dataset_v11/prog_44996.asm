; DESCRIPTION: Renders a magenta box of size 34x82 starting at (62, 37).
; PLAN: r0=62(x), r1=37(y), r2=34(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 37
LDI r2, 34
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
