; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (135, 138) with width 108 and height 110. Then Draws a yellow circle centered at (241, 243) with radius 13.
; PLAN: r0=135(x), r1=138(y), r2=108(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=241(x), r1=243(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (135, 138) with width 108 and height 110.
; PLAN: r0=135(x), r1=138(y), r2=108(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 138
LDI r2, 108
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (241, 243) with radius 13.
; PLAN: r0=241(x), r1=243(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 243
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
