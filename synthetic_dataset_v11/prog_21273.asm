; DESCRIPTION: Composite: . Then Places a cyan circle of radius 70 at center (112, 159). Then Renders a orange box of size 114x13 starting at (2, 58).
; PLAN: r0=112(x), r1=159(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=2(x), r1=58(y), r2=114(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 70 at center (112, 159).
; PLAN: r0=112(x), r1=159(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 159
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 114x13 starting at (2, 58).
; PLAN: r0=2(x), r1=58(y), r2=114(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 58
LDI r2, 114
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
