; DESCRIPTION: Composite: Renders a red box of size 103x52 starting at (26, 108) then Renders a blue disk with center (379, 120) and radius 59.
; PLAN: r0=26(x), r1=108(y), r2=103(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=120(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 108
LDI r2, 103
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 120
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
