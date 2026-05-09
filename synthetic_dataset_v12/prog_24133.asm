; DESCRIPTION: Places a blue 101x32 rectangle at position (149, 95).
; PLAN: r0=149(x), r1=95(y), r2=101(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 95
LDI r2, 101
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
