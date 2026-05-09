; DESCRIPTION: Composite: Places a blue circle of radius 72 at center (127, 73) then Renders a purple box of size 60x80 starting at (423, 150).
; PLAN: r0=127(x), r1=73(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=150(y), r7=60(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 73
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 150
LDI r7, 60
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
