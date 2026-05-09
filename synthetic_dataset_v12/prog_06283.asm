; DESCRIPTION: Places a white 69x22 rectangle at position (427, 196).
; PLAN: r0=427(x), r1=196(y), r2=69(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 196
LDI r2, 69
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
