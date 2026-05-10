; DESCRIPTION: Composite: Creates a red rectangular region at (280, 153) spanning 45 by 50 pixels then Renders a red line between points (80, 132) and (150, 189) then Places a black dot at position (103, 38).
; PLAN: r0=280(x), r1=153(y), r2=45(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=132(y1), r7=150(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=38(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 153
LDI r2, 45
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 132
LDI r7, 150
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 38
LDI r12, 0x000000
PSET r10, r11, r12
HALT
