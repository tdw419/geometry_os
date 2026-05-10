; DESCRIPTION: Places a white 15x99 rectangle at position (278, 34).
; PLAN: r0=278(x), r1=34(y), r2=15(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 34
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
