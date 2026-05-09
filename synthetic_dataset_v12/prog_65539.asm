; DESCRIPTION: Composite: Places a white dot at position (135, 129) then Places a blue line segment connecting (246, 140) to (344, 200).
; PLAN: r0=135(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=140(y1), r7=344(x2), r8=200(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 140
LDI r7, 344
LDI r8, 200
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
