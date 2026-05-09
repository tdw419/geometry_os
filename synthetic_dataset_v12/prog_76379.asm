; DESCRIPTION: Places a white 44x78 rectangle at position (145, 34).
; PLAN: r0=145(x), r1=34(y), r2=44(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 34
LDI r2, 44
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
