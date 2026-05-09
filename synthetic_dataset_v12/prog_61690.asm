; DESCRIPTION: Places a white 109x85 rectangle at position (78, 165).
; PLAN: r0=78(x), r1=165(y), r2=109(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 165
LDI r2, 109
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
