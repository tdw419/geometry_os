; DESCRIPTION: Places a purple 24x25 rectangle at position (147, 109).
; PLAN: r0=147(x), r1=109(y), r2=24(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 109
LDI r2, 24
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
