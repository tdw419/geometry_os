; DESCRIPTION: Composite: Creates a cyan circular shape at (135, 144) with radius 59 then Renders a green box of size 102x48 starting at (400, 73) then Renders a cyan line between points (270, 203) and (116, 252).
; PLAN: r0=135(x), r1=144(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=73(y), r7=102(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x1), r11=203(y1), r12=116(x2), r13=252(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 144
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 73
LDI r7, 102
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 203
LDI r12, 116
LDI r13, 252
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
