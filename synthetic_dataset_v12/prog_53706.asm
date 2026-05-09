; DESCRIPTION: Places a purple 102x78 rectangle at position (215, 147).
; PLAN: r0=215(x), r1=147(y), r2=102(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 147
LDI r2, 102
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
