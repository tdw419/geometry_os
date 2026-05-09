; DESCRIPTION: Places a white 115x104 rectangle at position (95, 126).
; PLAN: r0=95(x), r1=126(y), r2=115(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 126
LDI r2, 115
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
