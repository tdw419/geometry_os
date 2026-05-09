; DESCRIPTION: Composite: Renders a cyan disk with center (432, 194) and radius 34 then Renders a magenta line between points (156, 239) and (364, 39).
; PLAN: r0=432(x), r1=194(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=239(y1), r7=364(x2), r8=39(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 194
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 239
LDI r7, 364
LDI r8, 39
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
