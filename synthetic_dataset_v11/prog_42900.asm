; DESCRIPTION: Places a green 47x43 rectangle at position (134, 130).
; PLAN: r0=134(x), r1=130(y), r2=47(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 130
LDI r2, 47
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
