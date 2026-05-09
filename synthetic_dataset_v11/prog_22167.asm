; DESCRIPTION: Places a white 30x68 rectangle at position (167, 145).
; PLAN: r0=167(x), r1=145(y), r2=30(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 145
LDI r2, 30
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
