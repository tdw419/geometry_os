; DESCRIPTION: Composite: Places a green line segment connecting (240, 95) to (265, 31) then Renders a magenta box of size 65x33 starting at (338, 11).
; PLAN: r0=240(x1), r1=95(y1), r2=265(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=11(y), r7=65(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 95
LDI r2, 265
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 11
LDI r7, 65
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
