; DESCRIPTION: Places a white 13x57 rectangle at position (253, 66).
; PLAN: r0=253(x), r1=66(y), r2=13(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 66
LDI r2, 13
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
