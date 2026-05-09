; DESCRIPTION: Places a green 19x102 rectangle at position (155, 7).
; PLAN: r0=155(x), r1=7(y), r2=19(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 7
LDI r2, 19
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
