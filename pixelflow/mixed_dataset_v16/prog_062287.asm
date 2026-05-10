; DESCRIPTION: Composite: Places a black dot at position (120, 72) then Draws a magenta rectangle at (398, 114) with width 18 and height 32 then Renders a cyan line between points (4, 6) and (90, 143).
; PLAN: r0=120(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=114(y), r7=18(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x1), r11=6(y1), r12=90(x2), r13=143(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 72
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 398
LDI r6, 114
LDI r7, 18
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 6
LDI r12, 90
LDI r13, 143
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
