; DESCRIPTION: Composite: Renders a white line between points (343, 132) and (484, 202) then Places a green 54x90 rectangle at position (185, 60).
; PLAN: r0=343(x1), r1=132(y1), r2=484(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=60(y), r7=54(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 132
LDI r2, 484
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 60
LDI r7, 54
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
