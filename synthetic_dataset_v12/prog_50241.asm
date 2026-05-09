; DESCRIPTION: Composite: Places a magenta line segment connecting (327, 58) to (189, 165) then Places a yellow 107x94 rectangle at position (140, 38).
; PLAN: r0=327(x1), r1=58(y1), r2=189(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=38(y), r7=107(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 58
LDI r2, 189
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 38
LDI r7, 107
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
