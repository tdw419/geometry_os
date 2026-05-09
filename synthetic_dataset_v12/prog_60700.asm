; DESCRIPTION: Places a white 119x98 rectangle at position (20, 70).
; PLAN: r0=20(x), r1=70(y), r2=119(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 70
LDI r2, 119
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
