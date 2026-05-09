; DESCRIPTION: Places a white 29x79 rectangle at position (19, 8).
; PLAN: r0=19(x), r1=8(y), r2=29(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 8
LDI r2, 29
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
