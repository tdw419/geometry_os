; DESCRIPTION: Composite: Places a red dot at position (21, 48) then Renders a magenta line between points (16, 117) and (83, 223) then Places a white circle of radius 79 at center (91, 162).
; PLAN: r0=21(x), r1=48(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=117(y1), r7=83(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=162(y), r12=79(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 48
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 16
LDI r6, 117
LDI r7, 83
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 162
LDI r12, 79
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
