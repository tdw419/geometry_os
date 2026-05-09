; DESCRIPTION: Places a red 94x66 rectangle at position (119, 109).
; PLAN: r0=119(x), r1=109(y), r2=94(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 94
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
