; DESCRIPTION: Composite: . Then Renders a cyan disk with center (186, 163) and radius 23. Then Draws a cyan rectangle at (62, 34) with width 66 and height 14.
; PLAN: r0=186(x), r1=163(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=62(x), r1=34(y), r2=66(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (186, 163) and radius 23.
; PLAN: r0=186(x), r1=163(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 163
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (62, 34) with width 66 and height 14.
; PLAN: r0=62(x), r1=34(y), r2=66(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 34
LDI r2, 66
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
