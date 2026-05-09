; DESCRIPTION: Composite: Renders a green disk with center (139, 129) and radius 43 then Renders a cyan box of size 116x111 starting at (113, 115) then Renders a black line between points (37, 242) and (429, 4).
; PLAN: r0=139(x), r1=129(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=115(y), r7=116(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x1), r11=242(y1), r12=429(x2), r13=4(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 129
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 115
LDI r7, 116
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 242
LDI r12, 429
LDI r13, 4
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
