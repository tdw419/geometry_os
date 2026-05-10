; DESCRIPTION: Composite: Places a white 118x22 rectangle at position (367, 120) then Places a orange line segment connecting (277, 2) to (425, 223).
; PLAN: r0=367(x), r1=120(y), r2=118(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=2(y1), r7=425(x2), r8=223(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 120
LDI r2, 118
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 2
LDI r7, 425
LDI r8, 223
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
