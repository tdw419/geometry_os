; DESCRIPTION: Composite: Places a white dot at position (360, 151) then Renders a cyan line between points (265, 106) and (72, 44) then Renders a cyan box of size 46x112 starting at (270, 88).
; PLAN: r0=360(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=265(x1), r6=106(y1), r7=72(x2), r8=44(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=88(y), r12=46(width), r13=112(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 151
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 106
LDI r7, 72
LDI r8, 44
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 88
LDI r12, 46
LDI r13, 112
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
