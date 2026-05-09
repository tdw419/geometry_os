; DESCRIPTION: Composite: . Then Draws a orange circle centered at (115, 35) with radius 13. Then Creates a cyan rectangular region at (34, 69) spanning 79 by 51 pixels.
; PLAN: r0=115(x), r1=35(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=69(y), r2=79(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (115, 35) with radius 13.
; PLAN: r0=115(x), r1=35(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 35
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (34, 69) spanning 79 by 51 pixels.
; PLAN: r0=34(x), r1=69(y), r2=79(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 69
LDI r2, 79
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
