; DESCRIPTION: Places a purple 93x70 rectangle at position (269, 184).
; PLAN: r0=269(x), r1=184(y), r2=93(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 184
LDI r2, 93
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
