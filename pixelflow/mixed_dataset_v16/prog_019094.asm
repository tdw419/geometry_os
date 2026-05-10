; DESCRIPTION: Composite: Renders a red line between points (30, 153) and (312, 228) then Places a purple 23x89 rectangle at position (38, 62).
; PLAN: r0=30(x1), r1=153(y1), r2=312(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=62(y), r7=23(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 153
LDI r2, 312
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 62
LDI r7, 23
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
