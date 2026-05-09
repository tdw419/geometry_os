; DESCRIPTION: Places a white 40x107 rectangle at position (162, 9).
; PLAN: r0=162(x), r1=9(y), r2=40(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 9
LDI r2, 40
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
