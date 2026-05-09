; DESCRIPTION: Composite: . Then Renders a orange box of size 39x65 starting at (147, 16). Then Places a purple circle of radius 55 at center (59, 176).
; PLAN: r0=147(x), r1=16(y), r2=39(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=59(x), r1=176(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange box of size 39x65 starting at (147, 16).
; PLAN: r0=147(x), r1=16(y), r2=39(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 16
LDI r2, 39
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 55 at center (59, 176).
; PLAN: r0=59(x), r1=176(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 176
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
