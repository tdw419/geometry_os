; DESCRIPTION: Composite: Renders a cyan line between points (289, 238) and (78, 66) then Renders a purple box of size 83x68 starting at (410, 57) then Renders a magenta disk with center (76, 90) and radius 68.
; PLAN: r0=289(x1), r1=238(y1), r2=78(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=57(y), r7=83(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=90(y), r12=68(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 238
LDI r2, 78
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 57
LDI r7, 83
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 90
LDI r12, 68
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
