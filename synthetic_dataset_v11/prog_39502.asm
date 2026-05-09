; DESCRIPTION: Composite: . Then Draws a blue rectangle at (163, 154) with width 47 and height 16. Then Renders a cyan line between points (203, 83) and (202, 108).
; PLAN: r0=163(x), r1=154(y), r2=47(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x1), r1=83(y1), r2=202(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (163, 154) with width 47 and height 16.
; PLAN: r0=163(x), r1=154(y), r2=47(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 154
LDI r2, 47
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (203, 83) and (202, 108).
; PLAN: r0=203(x1), r1=83(y1), r2=202(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 83
LDI r2, 202
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
