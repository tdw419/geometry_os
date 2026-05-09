; DESCRIPTION: Places a green 102x118 rectangle at position (123, 8).
; PLAN: r0=123(x), r1=8(y), r2=102(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 8
LDI r2, 102
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
