; DESCRIPTION: Composite: Sets a single orange pixel at (454, 78) then Places a cyan 113x111 rectangle at position (60, 2) then Draws a red line from (167, 183) to (130, 39).
; PLAN: r0=454(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=2(y), r7=113(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x1), r11=183(y1), r12=130(x2), r13=39(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 60
LDI r6, 2
LDI r7, 113
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 183
LDI r12, 130
LDI r13, 39
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
