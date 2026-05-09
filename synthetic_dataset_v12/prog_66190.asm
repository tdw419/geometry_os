; DESCRIPTION: Composite: Draws a black rectangle at (72, 133) with width 38 and height 92 then Renders a orange disk with center (247, 71) and radius 68 then Renders a cyan line between points (160, 81) and (168, 48).
; PLAN: r0=72(x), r1=133(y), r2=38(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=71(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x1), r11=81(y1), r12=168(x2), r13=48(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 133
LDI r2, 38
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 71
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 81
LDI r12, 168
LDI r13, 48
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
