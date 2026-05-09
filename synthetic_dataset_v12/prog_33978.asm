; DESCRIPTION: Composite: Places a green circle of radius 70 at center (133, 135) then Renders a yellow box of size 107x71 starting at (246, 66).
; PLAN: r0=133(x), r1=135(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=66(y), r7=107(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 135
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 66
LDI r7, 107
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
