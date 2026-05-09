; DESCRIPTION: Places a red 119x94 rectangle at position (119, 60).
; PLAN: r0=119(x), r1=60(y), r2=119(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 60
LDI r2, 119
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
