; DESCRIPTION: Places a purple 83x95 rectangle at position (72, 129).
; PLAN: r0=72(x), r1=129(y), r2=83(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 129
LDI r2, 83
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
