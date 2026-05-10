; DESCRIPTION: Composite: Renders a cyan disk with center (90, 133) and radius 78 then Renders a yellow box of size 51x25 starting at (155, 227).
; PLAN: r0=90(x), r1=133(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=227(y), r7=51(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 133
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 227
LDI r7, 51
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
