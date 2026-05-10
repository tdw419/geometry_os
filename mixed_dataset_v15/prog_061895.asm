; DESCRIPTION: Places a white 46x89 rectangle at position (49, 85).
; PLAN: r0=49(x), r1=85(y), r2=46(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 85
LDI r2, 46
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
