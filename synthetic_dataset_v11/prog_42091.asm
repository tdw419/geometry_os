; DESCRIPTION: Composite: . Then Creates a green circular shape at (146, 161) with radius 66. Then Draws a cyan rectangle at (44, 11) with width 34 and height 22.
; PLAN: r0=146(x), r1=161(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=44(x), r1=11(y), r2=34(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (146, 161) with radius 66.
; PLAN: r0=146(x), r1=161(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 161
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (44, 11) with width 34 and height 22.
; PLAN: r0=44(x), r1=11(y), r2=34(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 11
LDI r2, 34
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
