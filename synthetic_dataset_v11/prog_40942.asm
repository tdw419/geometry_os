; DESCRIPTION: Composite: . Then Renders a green line between points (225, 255) and (38, 65). Then Draws a red rectangle at (56, 192) with width 109 and height 18.
; PLAN: r0=225(x1), r1=255(y1), r2=38(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=192(y), r2=109(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (225, 255) and (38, 65).
; PLAN: r0=225(x1), r1=255(y1), r2=38(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 255
LDI r2, 38
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (56, 192) with width 109 and height 18.
; PLAN: r0=56(x), r1=192(y), r2=109(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 192
LDI r2, 109
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
