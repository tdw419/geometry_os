; DESCRIPTION: Places a white 84x26 rectangle at position (148, 25).
; PLAN: r0=148(x), r1=25(y), r2=84(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 25
LDI r2, 84
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
