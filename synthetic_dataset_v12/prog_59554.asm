; DESCRIPTION: Composite: Places a cyan circle of radius 12 at center (210, 36) then Places a cyan line segment connecting (356, 114) to (17, 105) then Places a yellow 48x30 rectangle at position (373, 24).
; PLAN: r0=210(x), r1=36(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=114(y1), r7=17(x2), r8=105(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=24(y), r12=48(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 36
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 114
LDI r7, 17
LDI r8, 105
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 24
LDI r12, 48
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
