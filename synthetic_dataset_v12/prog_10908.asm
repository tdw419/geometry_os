; DESCRIPTION: Composite: Places a red circle of radius 62 at center (180, 127) then Places a black line segment connecting (120, 117) to (297, 164).
; PLAN: r0=180(x), r1=127(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=117(y1), r7=297(x2), r8=164(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 127
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 117
LDI r7, 297
LDI r8, 164
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
