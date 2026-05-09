; DESCRIPTION: Composite: Places a red circle of radius 62 at center (156, 120) then Places a cyan line segment connecting (57, 99) to (14, 16).
; PLAN: r0=156(x), r1=120(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x1), r6=99(y1), r7=14(x2), r8=16(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 120
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 99
LDI r7, 14
LDI r8, 16
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
