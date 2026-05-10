; DESCRIPTION: Places a purple 87x83 box at position (111, 150).
; PLAN: r0=111(x), r1=150(y), r2=87(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 150
LDI r2, 87
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
