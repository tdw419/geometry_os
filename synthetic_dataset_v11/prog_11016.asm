; DESCRIPTION: Places a green 49x30 rectangle at position (43, 187).
; PLAN: r0=43(x), r1=187(y), r2=49(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 187
LDI r2, 49
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
