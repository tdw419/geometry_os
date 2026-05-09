; DESCRIPTION: Composite: Places a white circle of radius 66 at center (283, 183) then Places a blue 72x90 rectangle at position (186, 158) then Places a red dot at position (369, 177).
; PLAN: r0=283(x), r1=183(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=158(y), r7=72(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=177(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 183
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 158
LDI r7, 72
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 177
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
