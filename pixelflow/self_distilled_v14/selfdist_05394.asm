; DESCRIPTION: Places a purple 54x111 box at position (376, 69).
; PLAN: r0=376(x), r1=69(y), r2=54(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 69
LDI r2, 54
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
