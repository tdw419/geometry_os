; DESCRIPTION: Composite: Draws a magenta line from (374, 53) to (177, 129) then Creates a purple rectangular region at (264, 47) spanning 24 by 101 pixels.
; PLAN: r0=374(x1), r1=53(y1), r2=177(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=47(y), r7=24(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 53
LDI r2, 177
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 47
LDI r7, 24
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
