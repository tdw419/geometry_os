; DESCRIPTION: Composite: Draws a magenta line from (98, 187) to (165, 115) then Renders a yellow box of size 101x53 starting at (131, 135).
; PLAN: r0=98(x1), r1=187(y1), r2=165(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=135(y), r7=101(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 187
LDI r2, 165
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 135
LDI r7, 101
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
