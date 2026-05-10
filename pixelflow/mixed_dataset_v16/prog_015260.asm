; DESCRIPTION: Composite: Places a green 54x107 rectangle at position (167, 133) then Places a white line segment connecting (323, 161) to (311, 85).
; PLAN: r0=167(x), r1=133(y), r2=54(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x1), r6=161(y1), r7=311(x2), r8=85(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 133
LDI r2, 54
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 161
LDI r7, 311
LDI r8, 85
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
