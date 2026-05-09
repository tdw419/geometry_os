; DESCRIPTION: Places a white 97x81 rectangle at position (100, 20).
; PLAN: r0=100(x), r1=20(y), r2=97(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 20
LDI r2, 97
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
