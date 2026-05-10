; DESCRIPTION: Composite: Sets a single green pixel at (72, 122) then Renders a green disk with center (106, 102) and radius 16 then Renders a red box of size 28x95 starting at (46, 135).
; PLAN: r0=72(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=102(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=135(y), r12=28(width), r13=95(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 106
LDI r6, 102
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 135
LDI r12, 28
LDI r13, 95
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
