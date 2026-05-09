; DESCRIPTION: Places a magenta 43x14 rectangle at position (322, 207).
; PLAN: r0=322(x), r1=207(y), r2=43(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 207
LDI r2, 43
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
