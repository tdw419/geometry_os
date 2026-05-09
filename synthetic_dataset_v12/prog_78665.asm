; DESCRIPTION: Places a red 73x24 rectangle at position (76, 211).
; PLAN: r0=76(x), r1=211(y), r2=73(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 211
LDI r2, 73
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
