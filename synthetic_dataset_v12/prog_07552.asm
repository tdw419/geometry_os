; DESCRIPTION: Composite: Renders a cyan line between points (89, 19) and (20, 89) then Places a yellow dot at position (265, 103) then Places a green 60x46 rectangle at position (152, 12).
; PLAN: r0=89(x1), r1=19(y1), r2=20(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=103(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=12(y), r12=60(width), r13=46(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 19
LDI r2, 20
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 103
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 152
LDI r11, 12
LDI r12, 60
LDI r13, 46
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
