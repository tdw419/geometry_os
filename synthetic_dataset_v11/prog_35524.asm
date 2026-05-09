; DESCRIPTION: Places a white 62x24 rectangle at position (131, 226).
; PLAN: r0=131(x), r1=226(y), r2=62(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 226
LDI r2, 62
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
