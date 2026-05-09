; DESCRIPTION: Places a white 115x35 rectangle at position (290, 61).
; PLAN: r0=290(x), r1=61(y), r2=115(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 61
LDI r2, 115
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
