; DESCRIPTION: Places a white 54x98 rectangle at position (185, 88).
; PLAN: r0=185(x), r1=88(y), r2=54(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 88
LDI r2, 54
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
