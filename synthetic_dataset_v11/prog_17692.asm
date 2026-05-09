; DESCRIPTION: Places a blue 54x61 rectangle at position (139, 96).
; PLAN: r0=139(x), r1=96(y), r2=54(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 96
LDI r2, 54
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
