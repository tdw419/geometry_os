; DESCRIPTION: Composite: Renders a purple box of size 115x80 starting at (171, 170) then Renders a white line between points (160, 239) and (246, 114) then Renders a cyan disk with center (329, 86) and radius 61.
; PLAN: r0=171(x), r1=170(y), r2=115(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x1), r6=239(y1), r7=246(x2), r8=114(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=86(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 170
LDI r2, 115
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 239
LDI r7, 246
LDI r8, 114
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 86
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
