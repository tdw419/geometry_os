; DESCRIPTION: Composite: Renders a white disk with center (297, 93) and radius 66 then Draws a cyan line from (342, 9) to (449, 220).
; PLAN: r0=297(x), r1=93(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x1), r6=9(y1), r7=449(x2), r8=220(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 93
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 9
LDI r7, 449
LDI r8, 220
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
