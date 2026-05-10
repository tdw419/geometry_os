; DESCRIPTION: Places a white 110x15 rectangle at position (23, 91).
; PLAN: r0=23(x), r1=91(y), r2=110(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 91
LDI r2, 110
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
