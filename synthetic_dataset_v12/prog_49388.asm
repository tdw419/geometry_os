; DESCRIPTION: Composite: Renders a red line between points (488, 21) and (294, 50) then Draws a purple circle centered at (345, 67) with radius 61.
; PLAN: r0=488(x1), r1=21(y1), r2=294(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=67(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 488
LDI r1, 21
LDI r2, 294
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 67
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
