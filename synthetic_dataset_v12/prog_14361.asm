; DESCRIPTION: Places a white 57x78 rectangle at position (209, 23).
; PLAN: r0=209(x), r1=23(y), r2=57(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 23
LDI r2, 57
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
