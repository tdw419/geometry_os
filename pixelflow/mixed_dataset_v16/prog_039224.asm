; DESCRIPTION: Composite: Renders a cyan box of size 74x67 starting at (119, 154) then Draws a yellow line from (407, 204) to (471, 173) then Renders a cyan disk with center (207, 207) and radius 28.
; PLAN: r0=119(x), r1=154(y), r2=74(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=204(y1), r7=471(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=207(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 154
LDI r2, 74
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 204
LDI r7, 471
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 207
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
