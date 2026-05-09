; DESCRIPTION: Composite: Renders a cyan line between points (98, 76) and (344, 186) then Renders a black disk with center (398, 113) and radius 27.
; PLAN: r0=98(x1), r1=76(y1), r2=344(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=113(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 76
LDI r2, 344
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 113
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
