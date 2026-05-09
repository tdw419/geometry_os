; DESCRIPTION: Places a red 94x101 rectangle at position (75, 24).
; PLAN: r0=75(x), r1=24(y), r2=94(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 24
LDI r2, 94
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
