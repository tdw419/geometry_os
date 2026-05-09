; DESCRIPTION: Places a green 76x43 rectangle at position (273, 118).
; PLAN: r0=273(x), r1=118(y), r2=76(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 118
LDI r2, 76
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
