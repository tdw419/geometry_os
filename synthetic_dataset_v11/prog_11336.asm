; DESCRIPTION: Composite: . Then Draws a orange circle centered at (169, 232) with radius 17. Then Places a yellow 102x97 rectangle at position (112, 70).
; PLAN: r0=169(x), r1=232(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x), r1=70(y), r2=102(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (169, 232) with radius 17.
; PLAN: r0=169(x), r1=232(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 232
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 102x97 rectangle at position (112, 70).
; PLAN: r0=112(x), r1=70(y), r2=102(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 70
LDI r2, 102
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
