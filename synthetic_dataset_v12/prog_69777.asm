; DESCRIPTION: Composite: Renders a yellow line between points (53, 72) and (317, 207) then Places a magenta 52x120 rectangle at position (19, 55).
; PLAN: r0=53(x1), r1=72(y1), r2=317(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=55(y), r7=52(width), r8=120(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 72
LDI r2, 317
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 55
LDI r7, 52
LDI r8, 120
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
