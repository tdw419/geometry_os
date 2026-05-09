; DESCRIPTION: Composite: Places a cyan dot at position (21, 165) then Places a cyan line segment connecting (162, 64) to (297, 38) then Places a red circle of radius 50 at center (120, 57).
; PLAN: r0=21(x), r1=165(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=64(y1), r7=297(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=120(x), r11=57(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 165
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 64
LDI r7, 297
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 57
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
