; DESCRIPTION: Places a white 20x87 rectangle at position (18, 34).
; PLAN: r0=18(x), r1=34(y), r2=20(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 34
LDI r2, 20
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
