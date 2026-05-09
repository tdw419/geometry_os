; DESCRIPTION: Places a white 68x37 rectangle at position (94, 173).
; PLAN: r0=94(x), r1=173(y), r2=68(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 173
LDI r2, 68
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
