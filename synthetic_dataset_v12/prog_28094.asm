; DESCRIPTION: Composite: Renders a yellow disk with center (269, 140) and radius 79 then Renders a green box of size 38x11 starting at (362, 61).
; PLAN: r0=269(x), r1=140(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=61(y), r7=38(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 140
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 61
LDI r7, 38
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
