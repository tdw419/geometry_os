; DESCRIPTION: Composite: Sets a single white pixel at (157, 61) then Places a yellow line segment connecting (394, 21) to (255, 212).
; PLAN: r0=157(x), r1=61(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=21(y1), r7=255(x2), r8=212(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 61
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 21
LDI r7, 255
LDI r8, 212
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
