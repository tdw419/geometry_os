; DESCRIPTION: Composite: Renders a purple disk with center (366, 72) and radius 58 then Renders a cyan line between points (284, 226) and (165, 65).
; PLAN: r0=366(x), r1=72(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=226(y1), r7=165(x2), r8=65(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 72
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 226
LDI r7, 165
LDI r8, 65
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
