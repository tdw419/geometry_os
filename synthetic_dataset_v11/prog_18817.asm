; DESCRIPTION: Places a yellow 91x16 rectangle at position (17, 222).
; PLAN: r0=17(x), r1=222(y), r2=91(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 222
LDI r2, 91
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
