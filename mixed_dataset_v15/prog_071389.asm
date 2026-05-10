; DESCRIPTION: Composite: Creates a cyan circular shape at (443, 68) with radius 47 then Renders a purple line between points (160, 250) and (460, 210) then Creates a red rectangular region at (66, 6) spanning 94 by 51 pixels.
; PLAN: r0=443(x), r1=68(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=250(y1), r7=460(x2), r8=210(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=6(y), r12=94(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 68
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 250
LDI r7, 460
LDI r8, 210
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 6
LDI r12, 94
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
