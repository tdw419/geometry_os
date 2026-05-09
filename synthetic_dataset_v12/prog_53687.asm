; DESCRIPTION: Composite: Places a red 18x11 rectangle at position (236, 219) then Renders a green disk with center (377, 133) and radius 69.
; PLAN: r0=236(x), r1=219(y), r2=18(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=133(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 236
LDI r1, 219
LDI r2, 18
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 133
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
