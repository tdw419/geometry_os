; DESCRIPTION: Composite: Draws a red line from (0, 123) to (373, 203) then Places a yellow 115x68 rectangle at position (298, 40).
; PLAN: r0=0(x1), r1=123(y1), r2=373(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=40(y), r7=115(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 123
LDI r2, 373
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 40
LDI r7, 115
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
