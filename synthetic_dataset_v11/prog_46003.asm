; DESCRIPTION: Places a red 94x107 rectangle at position (1, 98).
; PLAN: r0=1(x), r1=98(y), r2=94(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 98
LDI r2, 94
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
