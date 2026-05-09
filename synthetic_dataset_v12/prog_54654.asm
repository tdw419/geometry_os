; DESCRIPTION: Composite: Places a magenta 104x102 rectangle at position (28, 98) then Draws a red line from (73, 240) to (189, 184).
; PLAN: r0=28(x), r1=98(y), r2=104(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x1), r6=240(y1), r7=189(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 98
LDI r2, 104
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 240
LDI r7, 189
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
