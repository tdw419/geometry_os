; DESCRIPTION: Composite: Draws a magenta rectangle at (272, 181) with width 65 and height 48 then Places a cyan line segment connecting (333, 3) to (422, 28).
; PLAN: r0=272(x), r1=181(y), r2=65(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=3(y1), r7=422(x2), r8=28(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 181
LDI r2, 65
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 3
LDI r7, 422
LDI r8, 28
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
