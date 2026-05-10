; DESCRIPTION: Composite: Draws a magenta line from (166, 48) to (220, 160) then Places a white 119x20 rectangle at position (3, 223).
; PLAN: r0=166(x1), r1=48(y1), r2=220(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=223(y), r7=119(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 48
LDI r2, 220
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 223
LDI r7, 119
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
