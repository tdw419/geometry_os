; DESCRIPTION: Composite: Renders a magenta disk with center (411, 117) and radius 80 then Renders a cyan line between points (445, 102) and (235, 31).
; PLAN: r0=411(x), r1=117(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x1), r6=102(y1), r7=235(x2), r8=31(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 117
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 102
LDI r7, 235
LDI r8, 31
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
