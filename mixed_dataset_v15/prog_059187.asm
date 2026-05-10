; DESCRIPTION: Composite: Places a green dot at position (261, 250) then Renders a magenta box of size 36x74 starting at (125, 75) then Renders a magenta disk with center (175, 64) and radius 13.
; PLAN: r0=261(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=75(y), r7=36(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=64(y), r12=13(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 75
LDI r7, 36
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 64
LDI r12, 13
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
