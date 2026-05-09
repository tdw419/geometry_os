; DESCRIPTION: Places a white 22x105 rectangle at position (457, 112).
; PLAN: r0=457(x), r1=112(y), r2=22(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 112
LDI r2, 22
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
