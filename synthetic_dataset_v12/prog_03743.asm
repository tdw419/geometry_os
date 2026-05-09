; DESCRIPTION: Places a yellow 91x97 rectangle at position (270, 6).
; PLAN: r0=270(x), r1=6(y), r2=91(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 6
LDI r2, 91
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
