; DESCRIPTION: Composite: Creates a yellow rectangular region at (452, 197) spanning 25 by 33 pixels then Places a cyan line segment connecting (19, 3) to (298, 22).
; PLAN: r0=452(x), r1=197(y), r2=25(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=3(y1), r7=298(x2), r8=22(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 197
LDI r2, 25
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 3
LDI r7, 298
LDI r8, 22
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
