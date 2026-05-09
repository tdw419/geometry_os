; DESCRIPTION: Places a green 76x62 rectangle at position (310, 169).
; PLAN: r0=310(x), r1=169(y), r2=76(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 169
LDI r2, 76
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
