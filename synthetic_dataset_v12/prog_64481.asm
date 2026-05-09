; DESCRIPTION: Places a green 78x12 rectangle at position (55, 161).
; PLAN: r0=55(x), r1=161(y), r2=78(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 161
LDI r2, 78
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
