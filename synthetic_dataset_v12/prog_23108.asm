; DESCRIPTION: Places a white 33x88 rectangle at position (66, 150).
; PLAN: r0=66(x), r1=150(y), r2=33(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 150
LDI r2, 33
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
