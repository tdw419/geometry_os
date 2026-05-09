; DESCRIPTION: Composite: Places a blue dot at position (123, 222) then Places a green circle of radius 33 at center (57, 135) then Renders a red box of size 91x38 starting at (77, 48).
; PLAN: r0=123(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=135(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=48(y), r12=91(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 135
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 48
LDI r12, 91
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
