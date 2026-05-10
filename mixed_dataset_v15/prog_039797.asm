; DESCRIPTION: Places a green 62x26 rectangle at position (175, 112).
; PLAN: r0=175(x), r1=112(y), r2=62(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 112
LDI r2, 62
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
