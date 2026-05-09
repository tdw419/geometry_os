; DESCRIPTION: Places a purple 24x100 rectangle at position (95, 8).
; PLAN: r0=95(x), r1=8(y), r2=24(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 8
LDI r2, 24
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
