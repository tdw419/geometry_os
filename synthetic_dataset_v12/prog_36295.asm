; DESCRIPTION: Places a white 119x26 rectangle at position (221, 196).
; PLAN: r0=221(x), r1=196(y), r2=119(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 196
LDI r2, 119
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
