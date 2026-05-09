; DESCRIPTION: Places a white 115x13 rectangle at position (137, 202).
; PLAN: r0=137(x), r1=202(y), r2=115(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 202
LDI r2, 115
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
