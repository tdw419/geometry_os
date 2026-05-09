; DESCRIPTION: Places a white 106x26 rectangle at position (115, 156).
; PLAN: r0=115(x), r1=156(y), r2=106(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 156
LDI r2, 106
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
