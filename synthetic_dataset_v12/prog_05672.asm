; DESCRIPTION: Composite: Places a magenta line segment connecting (374, 146) to (80, 239) then Renders a blue box of size 72x29 starting at (153, 124) then Places a blue dot at position (346, 89).
; PLAN: r0=374(x1), r1=146(y1), r2=80(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=124(y), r7=72(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x), r11=89(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 146
LDI r2, 80
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 124
LDI r7, 72
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 89
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
