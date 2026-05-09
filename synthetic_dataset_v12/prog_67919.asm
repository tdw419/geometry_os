; DESCRIPTION: Places a red 96x75 rectangle at position (204, 63).
; PLAN: r0=204(x), r1=63(y), r2=96(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 63
LDI r2, 96
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
