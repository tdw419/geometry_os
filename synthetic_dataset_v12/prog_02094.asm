; DESCRIPTION: Places a green 36x118 rectangle at position (188, 102).
; PLAN: r0=188(x), r1=102(y), r2=36(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 102
LDI r2, 36
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
