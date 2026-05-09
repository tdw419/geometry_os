; DESCRIPTION: Composite: . Then Draws a orange circle centered at (46, 189) with radius 16. Then Places a yellow 118x97 rectangle at position (128, 19).
; PLAN: r0=46(x), r1=189(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=19(y), r2=118(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (46, 189) with radius 16.
; PLAN: r0=46(x), r1=189(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 189
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 118x97 rectangle at position (128, 19).
; PLAN: r0=128(x), r1=19(y), r2=118(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 19
LDI r2, 118
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
