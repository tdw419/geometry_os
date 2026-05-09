; DESCRIPTION: Places a green 13x102 rectangle at position (105, 101).
; PLAN: r0=105(x), r1=101(y), r2=13(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 101
LDI r2, 13
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
