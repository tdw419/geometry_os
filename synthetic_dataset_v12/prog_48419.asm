; DESCRIPTION: Composite: Renders a white box of size 71x118 starting at (32, 25) then Creates a purple circular shape at (352, 137) with radius 71 then Renders a cyan line between points (382, 180) and (61, 215).
; PLAN: r0=32(x), r1=25(y), r2=71(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=137(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x1), r11=180(y1), r12=61(x2), r13=215(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 25
LDI r2, 71
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 137
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 180
LDI r12, 61
LDI r13, 215
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
