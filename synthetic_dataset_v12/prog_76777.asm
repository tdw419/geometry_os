; DESCRIPTION: Composite: Places a magenta dot at position (20, 240) then Renders a cyan line between points (252, 155) and (489, 98) then Places a magenta 17x83 rectangle at position (67, 120).
; PLAN: r0=20(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=155(y1), r7=489(x2), r8=98(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=120(y), r12=17(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 155
LDI r7, 489
LDI r8, 98
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 120
LDI r12, 17
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
