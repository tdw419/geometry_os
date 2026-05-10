; DESCRIPTION: Composite: Places a purple dot at position (169, 189) then Places a black 54x54 rectangle at position (186, 50) then Renders a green line between points (391, 48) and (300, 146).
; PLAN: r0=169(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=50(y), r7=54(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x1), r11=48(y1), r12=300(x2), r13=146(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 50
LDI r7, 54
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 48
LDI r12, 300
LDI r13, 146
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
