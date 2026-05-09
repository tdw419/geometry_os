; DESCRIPTION: Places a white 106x34 rectangle at position (78, 188).
; PLAN: r0=78(x), r1=188(y), r2=106(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 106
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
