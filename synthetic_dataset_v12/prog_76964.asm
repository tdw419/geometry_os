; DESCRIPTION: Composite: Renders a purple line between points (137, 129) and (292, 144) then Renders a black box of size 116x67 starting at (300, 61).
; PLAN: r0=137(x1), r1=129(y1), r2=292(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=61(y), r7=116(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 129
LDI r2, 292
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 61
LDI r7, 116
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
