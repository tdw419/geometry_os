; DESCRIPTION: Composite: Creates a yellow circular shape at (191, 187) with radius 60 then Draws a cyan line from (138, 21) to (269, 170).
; PLAN: r0=191(x), r1=187(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=21(y1), r7=269(x2), r8=170(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 187
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 21
LDI r7, 269
LDI r8, 170
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
