; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (86, 47) with width 105 and height 45. Then Creates a orange circular shape at (229, 133) with radius 15.
; PLAN: r0=86(x), r1=47(y), r2=105(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=229(x), r1=133(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (86, 47) with width 105 and height 45.
; PLAN: r0=86(x), r1=47(y), r2=105(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 47
LDI r2, 105
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (229, 133) with radius 15.
; PLAN: r0=229(x), r1=133(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 133
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
