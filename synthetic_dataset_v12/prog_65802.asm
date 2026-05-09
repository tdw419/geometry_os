; DESCRIPTION: Places a white 115x24 rectangle at position (282, 8).
; PLAN: r0=282(x), r1=8(y), r2=115(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 8
LDI r2, 115
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
