; DESCRIPTION: Composite: Places a white circle of radius 10 at center (286, 208) then Places a cyan line segment connecting (207, 0) to (62, 71).
; PLAN: r0=286(x), r1=208(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=0(y1), r7=62(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 208
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 0
LDI r7, 62
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
