; DESCRIPTION: Composite: Places a black dot at position (434, 223) then Places a cyan line segment connecting (482, 101) to (294, 192) then Places a green 55x20 rectangle at position (396, 209).
; PLAN: r0=434(x), r1=223(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=101(y1), r7=294(x2), r8=192(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=209(y), r12=55(width), r13=20(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 223
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 482
LDI r6, 101
LDI r7, 294
LDI r8, 192
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 209
LDI r12, 55
LDI r13, 20
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
