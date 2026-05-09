; DESCRIPTION: Places a magenta 43x111 rectangle at position (363, 67).
; PLAN: r0=363(x), r1=67(y), r2=43(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 67
LDI r2, 43
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
