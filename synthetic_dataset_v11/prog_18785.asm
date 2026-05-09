; DESCRIPTION: Places a magenta 15x27 rectangle at position (122, 71).
; PLAN: r0=122(x), r1=71(y), r2=15(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 71
LDI r2, 15
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
