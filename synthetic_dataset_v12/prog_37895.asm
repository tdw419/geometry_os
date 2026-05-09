; DESCRIPTION: Places a white 68x36 rectangle at position (207, 205).
; PLAN: r0=207(x), r1=205(y), r2=68(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 205
LDI r2, 68
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
