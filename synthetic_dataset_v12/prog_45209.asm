; DESCRIPTION: Composite: Creates a yellow circular shape at (320, 117) with radius 61 then Places a cyan line segment connecting (395, 25) to (373, 190).
; PLAN: r0=320(x), r1=117(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=25(y1), r7=373(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 117
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 25
LDI r7, 373
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
