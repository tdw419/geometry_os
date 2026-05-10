; DESCRIPTION: Places a magenta 30x50 box at position (371, 82).
; PLAN: r0=371(x), r1=82(y), r2=30(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 82
LDI r2, 30
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
