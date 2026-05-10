; DESCRIPTION: Composite: Places a green 96x88 rectangle at position (281, 138) then Renders a cyan disk with center (246, 28) and radius 27 then Places a blue line segment connecting (75, 184) to (418, 242).
; PLAN: r0=281(x), r1=138(y), r2=96(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=28(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x1), r11=184(y1), r12=418(x2), r13=242(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 138
LDI r2, 96
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 28
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 184
LDI r12, 418
LDI r13, 242
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
