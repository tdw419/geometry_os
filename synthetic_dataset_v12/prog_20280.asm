; DESCRIPTION: Composite: Renders a yellow line between points (47, 93) and (300, 109) then Places a yellow 70x119 rectangle at position (402, 31).
; PLAN: r0=47(x1), r1=93(y1), r2=300(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=31(y), r7=70(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 93
LDI r2, 300
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 31
LDI r7, 70
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
