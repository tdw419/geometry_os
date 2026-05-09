; DESCRIPTION: Composite: Places a white dot at position (462, 96) then Renders a cyan line between points (72, 202) and (334, 80) then Renders a white box of size 63x70 starting at (191, 33).
; PLAN: r0=462(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=202(y1), r7=334(x2), r8=80(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=33(y), r12=63(width), r13=70(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 202
LDI r7, 334
LDI r8, 80
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 33
LDI r12, 63
LDI r13, 70
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
