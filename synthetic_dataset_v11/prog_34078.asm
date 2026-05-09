; DESCRIPTION: Places a white 29x70 rectangle at position (185, 87).
; PLAN: r0=185(x), r1=87(y), r2=29(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 87
LDI r2, 29
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
