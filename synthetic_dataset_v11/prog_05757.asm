; DESCRIPTION: Places a yellow 119x50 rectangle at position (49, 99).
; PLAN: r0=49(x), r1=99(y), r2=119(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 99
LDI r2, 119
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
