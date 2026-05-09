; DESCRIPTION: Places a white 97x54 rectangle at position (30, 79).
; PLAN: r0=30(x), r1=79(y), r2=97(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 79
LDI r2, 97
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
