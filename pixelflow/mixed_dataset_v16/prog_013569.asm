; DESCRIPTION: Composite: Draws a black line from (241, 129) to (422, 179) then Renders a red box of size 117x36 starting at (9, 98).
; PLAN: r0=241(x1), r1=129(y1), r2=422(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=98(y), r7=117(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 129
LDI r2, 422
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 98
LDI r7, 117
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
