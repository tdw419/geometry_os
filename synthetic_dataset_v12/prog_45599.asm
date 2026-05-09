; DESCRIPTION: Places a green 68x107 rectangle at position (395, 49).
; PLAN: r0=395(x), r1=49(y), r2=68(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 49
LDI r2, 68
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
