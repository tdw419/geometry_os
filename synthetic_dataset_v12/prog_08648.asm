; DESCRIPTION: Composite: Places a cyan line segment connecting (11, 58) to (446, 246) then Places a red circle of radius 37 at center (122, 194).
; PLAN: r0=11(x1), r1=58(y1), r2=446(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=194(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 58
LDI r2, 446
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 194
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
