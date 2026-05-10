; DESCRIPTION: Composite: Renders a magenta disk with center (292, 92) and radius 60 then Renders a black line between points (106, 168) and (19, 190) then Places a yellow 37x91 rectangle at position (393, 24).
; PLAN: r0=292(x), r1=92(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=168(y1), r7=19(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=24(y), r12=37(width), r13=91(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 92
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 168
LDI r7, 19
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 24
LDI r12, 37
LDI r13, 91
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
