; DESCRIPTION: Places a green 58x103 rectangle at position (68, 118).
; PLAN: r0=68(x), r1=118(y), r2=58(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 118
LDI r2, 58
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
