; DESCRIPTION: Places a white 117x78 rectangle at position (46, 145).
; PLAN: r0=46(x), r1=145(y), r2=117(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 145
LDI r2, 117
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
