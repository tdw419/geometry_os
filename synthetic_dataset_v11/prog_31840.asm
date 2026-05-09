; DESCRIPTION: Places a green 26x107 rectangle at position (46, 98).
; PLAN: r0=46(x), r1=98(y), r2=26(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 98
LDI r2, 26
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
