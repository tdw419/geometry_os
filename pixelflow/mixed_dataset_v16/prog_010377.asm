; DESCRIPTION: Composite: Renders a white disk with center (170, 132) and radius 71 then Draws a cyan line from (40, 27) to (298, 168).
; PLAN: r0=170(x), r1=132(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x1), r6=27(y1), r7=298(x2), r8=168(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 132
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 27
LDI r7, 298
LDI r8, 168
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
