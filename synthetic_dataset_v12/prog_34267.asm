; DESCRIPTION: Composite: Places a yellow dot at position (242, 121) then Draws a yellow rectangle at (320, 153) with width 48 and height 77 then Renders a white line between points (421, 170) and (90, 12).
; PLAN: r0=242(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=153(y), r7=48(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x1), r11=170(y1), r12=90(x2), r13=12(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 320
LDI r6, 153
LDI r7, 48
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 170
LDI r12, 90
LDI r13, 12
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
