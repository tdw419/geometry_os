; DESCRIPTION: Places a white 14x99 rectangle at position (75, 49).
; PLAN: r0=75(x), r1=49(y), r2=14(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 49
LDI r2, 14
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
