; DESCRIPTION: Places a purple 91x87 rectangle at position (113, 147).
; PLAN: r0=113(x), r1=147(y), r2=91(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 147
LDI r2, 91
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
