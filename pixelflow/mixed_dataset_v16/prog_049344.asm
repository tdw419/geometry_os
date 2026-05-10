; DESCRIPTION: Places a white 66x29 box at position (99, 152).
; PLAN: r0=99(x), r1=152(y), r2=66(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 152
LDI r2, 66
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
