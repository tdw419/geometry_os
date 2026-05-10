; DESCRIPTION: Composite: Draws a cyan line from (141, 232) to (407, 103) then Draws a orange rectangle at (223, 129) with width 40 and height 111.
; PLAN: r0=141(x1), r1=232(y1), r2=407(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=129(y), r7=40(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 232
LDI r2, 407
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 129
LDI r7, 40
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
