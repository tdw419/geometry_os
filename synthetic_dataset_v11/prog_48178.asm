; DESCRIPTION: Places a white 63x118 rectangle at position (4, 68).
; PLAN: r0=4(x), r1=68(y), r2=63(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 68
LDI r2, 63
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
