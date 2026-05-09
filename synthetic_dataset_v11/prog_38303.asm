; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (206, 187) with width 48 and height 36. Then Creates a cyan circular shape at (125, 216) with radius 35.
; PLAN: r0=206(x), r1=187(y), r2=48(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=216(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (206, 187) with width 48 and height 36.
; PLAN: r0=206(x), r1=187(y), r2=48(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 187
LDI r2, 48
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (125, 216) with radius 35.
; PLAN: r0=125(x), r1=216(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 216
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
