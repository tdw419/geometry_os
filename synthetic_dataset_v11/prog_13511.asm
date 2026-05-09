; DESCRIPTION: Places a white 95x66 rectangle at position (49, 52).
; PLAN: r0=49(x), r1=52(y), r2=95(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 52
LDI r2, 95
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
