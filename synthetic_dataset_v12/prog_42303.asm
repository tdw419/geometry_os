; DESCRIPTION: Places a green 76x119 rectangle at position (65, 62).
; PLAN: r0=65(x), r1=62(y), r2=76(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 62
LDI r2, 76
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
