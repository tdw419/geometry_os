; DESCRIPTION: Places a white 115x60 rectangle at position (391, 179).
; PLAN: r0=391(x), r1=179(y), r2=115(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 179
LDI r2, 115
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
