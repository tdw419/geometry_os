; DESCRIPTION: Places a purple 95x95 rectangle at position (152, 64).
; PLAN: r0=152(x), r1=64(y), r2=95(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 64
LDI r2, 95
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
