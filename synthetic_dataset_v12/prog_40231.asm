; DESCRIPTION: Places a white 70x29 rectangle at position (100, 6).
; PLAN: r0=100(x), r1=6(y), r2=70(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 6
LDI r2, 70
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
