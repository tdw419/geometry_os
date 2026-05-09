; DESCRIPTION: Places a green 13x46 rectangle at position (153, 90).
; PLAN: r0=153(x), r1=90(y), r2=13(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 90
LDI r2, 13
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
