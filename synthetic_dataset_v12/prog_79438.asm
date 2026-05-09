; DESCRIPTION: Places a white 100x106 rectangle at position (374, 54).
; PLAN: r0=374(x), r1=54(y), r2=100(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 54
LDI r2, 100
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
