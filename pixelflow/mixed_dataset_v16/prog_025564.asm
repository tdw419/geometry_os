; DESCRIPTION: Places a green 66x40 rectangle at position (43, 50).
; PLAN: r0=43(x), r1=50(y), r2=66(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 50
LDI r2, 66
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
