; DESCRIPTION: Composite: Places a blue dot at position (77, 152) then Draws a red rectangle at (141, 38) with width 70 and height 48 then Draws a blue line from (80, 113) to (7, 238).
; PLAN: r0=77(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=38(y), r7=70(width), r8=48(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x1), r11=113(y1), r12=7(x2), r13=238(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 38
LDI r7, 70
LDI r8, 48
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 113
LDI r12, 7
LDI r13, 238
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
