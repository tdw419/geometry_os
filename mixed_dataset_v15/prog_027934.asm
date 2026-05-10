; DESCRIPTION: Composite: Places a black dot at position (397, 37) then Renders a white line between points (262, 38) and (3, 100) then Draws a yellow rectangle at (404, 103) with width 45 and height 13.
; PLAN: r0=397(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=38(y1), r7=3(x2), r8=100(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=103(y), r12=45(width), r13=13(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 262
LDI r6, 38
LDI r7, 3
LDI r8, 100
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 103
LDI r12, 45
LDI r13, 13
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
