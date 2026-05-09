; DESCRIPTION: Composite: Sets a single magenta pixel at (174, 55) then Renders a green line between points (106, 228) and (10, 17) then Renders a green box of size 59x96 starting at (104, 146).
; PLAN: r0=174(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=228(y1), r7=10(x2), r8=17(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=146(y), r12=59(width), r13=96(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 228
LDI r7, 10
LDI r8, 17
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 146
LDI r12, 59
LDI r13, 96
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
