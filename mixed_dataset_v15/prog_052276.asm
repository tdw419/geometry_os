; DESCRIPTION: Places a red 43x75 rectangle at position (234, 24).
; PLAN: r0=234(x), r1=24(y), r2=43(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 24
LDI r2, 43
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
