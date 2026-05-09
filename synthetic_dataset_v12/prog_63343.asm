; DESCRIPTION: Composite: Draws a green line from (396, 213) to (58, 166) then Draws a orange rectangle at (294, 47) with width 108 and height 97.
; PLAN: r0=396(x1), r1=213(y1), r2=58(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=47(y), r7=108(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 213
LDI r2, 58
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 47
LDI r7, 108
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
