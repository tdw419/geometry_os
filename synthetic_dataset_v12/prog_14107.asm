; DESCRIPTION: Places a magenta 90x26 rectangle at position (361, 159).
; PLAN: r0=361(x), r1=159(y), r2=90(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 159
LDI r2, 90
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
