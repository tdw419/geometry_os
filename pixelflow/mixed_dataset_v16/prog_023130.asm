; DESCRIPTION: Composite: Places a magenta 28x50 rectangle at position (423, 150) then Renders a orange line between points (439, 221) and (339, 99).
; PLAN: r0=423(x), r1=150(y), r2=28(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=221(y1), r7=339(x2), r8=99(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 150
LDI r2, 28
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 221
LDI r7, 339
LDI r8, 99
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
