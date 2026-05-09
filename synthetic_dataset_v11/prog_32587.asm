; DESCRIPTION: Places a white 97x109 rectangle at position (158, 140).
; PLAN: r0=158(x), r1=140(y), r2=97(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 140
LDI r2, 97
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
