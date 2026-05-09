; DESCRIPTION: Composite: Places a purple 60x96 rectangle at position (317, 107) then Renders a green line between points (96, 174) and (214, 205) then Places a black dot at position (462, 113).
; PLAN: r0=317(x), r1=107(y), r2=60(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x1), r6=174(y1), r7=214(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=113(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 107
LDI r2, 60
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 174
LDI r7, 214
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 113
LDI r12, 0x000000
PSET r10, r11, r12
HALT
