; DESCRIPTION: Composite: Renders a magenta box of size 59x59 starting at (416, 102) then Renders a purple disk with center (446, 161) and radius 53.
; PLAN: r0=416(x), r1=102(y), r2=59(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=161(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 102
LDI r2, 59
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 161
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
