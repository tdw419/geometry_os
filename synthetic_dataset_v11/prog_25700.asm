; DESCRIPTION: Places a red 94x107 rectangle at position (31, 10).
; PLAN: r0=31(x), r1=10(y), r2=94(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 10
LDI r2, 94
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
