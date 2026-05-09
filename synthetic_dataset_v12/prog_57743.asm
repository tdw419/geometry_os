; DESCRIPTION: Renders a magenta box of size 117x39 starting at (376, 61).
; PLAN: r0=376(x), r1=61(y), r2=117(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 61
LDI r2, 117
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
