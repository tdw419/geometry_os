; DESCRIPTION: Places a white 18x57 box at position (355, 42).
; PLAN: r0=355(x), r1=42(y), r2=18(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 42
LDI r2, 18
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
