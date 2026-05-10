; DESCRIPTION: Composite: Places a magenta line segment connecting (280, 253) to (301, 196) then Draws a blue rectangle at (211, 129) with width 114 and height 16.
; PLAN: r0=280(x1), r1=253(y1), r2=301(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=129(y), r7=114(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 253
LDI r2, 301
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 129
LDI r7, 114
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
