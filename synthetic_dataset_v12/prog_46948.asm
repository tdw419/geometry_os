; DESCRIPTION: Composite: Places a white 79x117 rectangle at position (111, 87) then Renders a yellow line between points (141, 198) and (121, 73).
; PLAN: r0=111(x), r1=87(y), r2=79(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=198(y1), r7=121(x2), r8=73(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 87
LDI r2, 79
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 198
LDI r7, 121
LDI r8, 73
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
