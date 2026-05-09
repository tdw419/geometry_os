; DESCRIPTION: Places a blue 24x74 rectangle at position (379, 142).
; PLAN: r0=379(x), r1=142(y), r2=24(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 142
LDI r2, 24
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
