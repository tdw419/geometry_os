; DESCRIPTION: Composite: Sets a single green pixel at (156, 253) then Draws a red rectangle at (196, 112) with width 21 and height 82 then Draws a yellow line from (460, 25) to (184, 38).
; PLAN: r0=156(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=112(y), r7=21(width), r8=82(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x1), r11=25(y1), r12=184(x2), r13=38(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 196
LDI r6, 112
LDI r7, 21
LDI r8, 82
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 25
LDI r12, 184
LDI r13, 38
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
