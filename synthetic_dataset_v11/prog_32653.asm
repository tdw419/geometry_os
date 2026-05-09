; DESCRIPTION: Places a white 44x66 rectangle at position (115, 90).
; PLAN: r0=115(x), r1=90(y), r2=44(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 90
LDI r2, 44
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
