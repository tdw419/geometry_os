; DESCRIPTION: Composite: Renders a green disk with center (339, 111) and radius 55 then Renders a cyan line between points (79, 210) and (460, 8).
; PLAN: r0=339(x), r1=111(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x1), r6=210(y1), r7=460(x2), r8=8(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 111
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 210
LDI r7, 460
LDI r8, 8
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
