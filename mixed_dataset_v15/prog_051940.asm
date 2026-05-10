; DESCRIPTION: Composite: Draws a orange line from (0, 46) to (261, 13) then Places a red 23x53 rectangle at position (415, 156).
; PLAN: r0=0(x1), r1=46(y1), r2=261(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=156(y), r7=23(width), r8=53(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 46
LDI r2, 261
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 156
LDI r7, 23
LDI r8, 53
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
