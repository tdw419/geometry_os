; DESCRIPTION: Composite: Renders a white line between points (462, 86) and (398, 151) then Draws a purple rectangle at (346, 18) with width 62 and height 65.
; PLAN: r0=462(x1), r1=86(y1), r2=398(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=18(y), r7=62(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 86
LDI r2, 398
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 18
LDI r7, 62
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
