; DESCRIPTION: Places a white 23x71 rectangle at position (115, 130).
; PLAN: r0=115(x), r1=130(y), r2=23(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 130
LDI r2, 23
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
