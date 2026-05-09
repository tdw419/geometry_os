; DESCRIPTION: Places a white 38x94 rectangle at position (205, 105).
; PLAN: r0=205(x), r1=105(y), r2=38(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 105
LDI r2, 38
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
