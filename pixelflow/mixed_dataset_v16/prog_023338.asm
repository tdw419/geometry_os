; DESCRIPTION: Composite: Sets a single magenta pixel at (503, 161) then Renders a cyan line between points (414, 6) and (59, 162) then Draws a cyan rectangle at (32, 134) with width 94 and height 32.
; PLAN: r0=503(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=6(y1), r7=59(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=134(y), r12=94(width), r13=32(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 6
LDI r7, 59
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 134
LDI r12, 94
LDI r13, 32
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
