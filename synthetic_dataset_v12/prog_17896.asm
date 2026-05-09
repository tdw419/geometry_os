; DESCRIPTION: Places a white 42x117 rectangle at position (378, 23).
; PLAN: r0=378(x), r1=23(y), r2=42(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 23
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
