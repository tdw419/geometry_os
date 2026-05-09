; DESCRIPTION: Composite: Places a magenta line segment connecting (82, 131) to (367, 136) then Places a red 50x17 rectangle at position (453, 207) then Places a white dot at position (262, 194).
; PLAN: r0=82(x1), r1=131(y1), r2=367(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=207(y), r7=50(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=194(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 131
LDI r2, 367
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 207
LDI r7, 50
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 194
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
