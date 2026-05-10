; DESCRIPTION: Composite: Draws a cyan rectangle at (193, 168) with width 97 and height 72 then Renders a blue disk with center (63, 107) and radius 54.
; PLAN: r0=193(x), r1=168(y), r2=97(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=107(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 168
LDI r2, 97
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 107
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
