; DESCRIPTION: Places a white 46x82 rectangle at position (94, 149).
; PLAN: r0=94(x), r1=149(y), r2=46(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 149
LDI r2, 46
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
