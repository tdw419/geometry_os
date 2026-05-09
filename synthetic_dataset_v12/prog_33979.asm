; DESCRIPTION: Composite: Draws a black line from (168, 105) to (269, 197) then Creates a green rectangular region at (126, 129) spanning 74 by 109 pixels.
; PLAN: r0=168(x1), r1=105(y1), r2=269(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=129(y), r7=74(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 105
LDI r2, 269
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 129
LDI r7, 74
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
