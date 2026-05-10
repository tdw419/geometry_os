; DESCRIPTION: Composite: Renders a purple disk with center (420, 88) and radius 72 then Places a cyan line segment connecting (235, 99) to (164, 168) then Places a yellow 71x98 rectangle at position (257, 27).
; PLAN: r0=420(x), r1=88(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=99(y1), r7=164(x2), r8=168(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=27(y), r12=71(width), r13=98(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 88
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 99
LDI r7, 164
LDI r8, 168
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 27
LDI r12, 71
LDI r13, 98
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
