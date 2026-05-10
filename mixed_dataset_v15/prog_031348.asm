; DESCRIPTION: Composite: Draws a white line from (48, 29) to (243, 31) then Renders a orange disk with center (295, 135) and radius 80 then Draws a magenta rectangle at (171, 43) with width 120 and height 71.
; PLAN: r0=48(x1), r1=29(y1), r2=243(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=135(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=43(y), r12=120(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 29
LDI r2, 243
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 135
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 43
LDI r12, 120
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
