; DESCRIPTION: Composite: . Then Draws a orange circle centered at (117, 226) with radius 12. Then Renders a orange box of size 38x25 starting at (65, 152).
; PLAN: r0=117(x), r1=226(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x), r1=152(y), r2=38(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (117, 226) with radius 12.
; PLAN: r0=117(x), r1=226(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 226
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 38x25 starting at (65, 152).
; PLAN: r0=65(x), r1=152(y), r2=38(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 152
LDI r2, 38
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
