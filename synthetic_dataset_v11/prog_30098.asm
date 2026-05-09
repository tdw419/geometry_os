; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (149, 129) with width 99 and height 52. Then Places a white circle of radius 76 at center (84, 154).
; PLAN: r0=149(x), r1=129(y), r2=99(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x), r1=154(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan rectangle at (149, 129) with width 99 and height 52.
; PLAN: r0=149(x), r1=129(y), r2=99(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 129
LDI r2, 99
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 76 at center (84, 154).
; PLAN: r0=84(x), r1=154(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 154
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
