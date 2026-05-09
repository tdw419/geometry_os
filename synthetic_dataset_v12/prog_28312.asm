; DESCRIPTION: Places a white 115x85 rectangle at position (263, 97).
; PLAN: r0=263(x), r1=97(y), r2=115(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 97
LDI r2, 115
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
