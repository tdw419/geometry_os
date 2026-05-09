; DESCRIPTION: Composite: Places a green circle of radius 13 at center (220, 143) then Renders a green box of size 44x111 starting at (84, 2).
; PLAN: r0=220(x), r1=143(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=84(x), r6=2(y), r7=44(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 143
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 84
LDI r6, 2
LDI r7, 44
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
