; DESCRIPTION: Composite: Places a cyan line segment connecting (27, 247) to (443, 3) then Places a red circle of radius 75 at center (269, 112).
; PLAN: r0=27(x1), r1=247(y1), r2=443(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=112(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 247
LDI r2, 443
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 112
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
