; DESCRIPTION: Places a magenta 97x65 rectangle at position (237, 5).
; PLAN: r0=237(x), r1=5(y), r2=97(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 5
LDI r2, 97
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
