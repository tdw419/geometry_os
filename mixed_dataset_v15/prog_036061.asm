; DESCRIPTION: Composite: Renders a red line between points (297, 177) and (511, 120) then Renders a white box of size 53x23 starting at (328, 85).
; PLAN: r0=297(x1), r1=177(y1), r2=511(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=85(y), r7=53(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 177
LDI r2, 511
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 85
LDI r7, 53
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
