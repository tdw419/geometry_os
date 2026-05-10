; DESCRIPTION: Renders a magenta box of size 53x58 starting at (370, 120).
; PLAN: r0=370(x), r1=120(y), r2=53(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 120
LDI r2, 53
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
