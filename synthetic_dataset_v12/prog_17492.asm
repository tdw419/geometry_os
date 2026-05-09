; DESCRIPTION: Composite: Creates a red circular shape at (350, 129) with radius 35 then Creates a green rectangular region at (242, 6) spanning 50 by 37 pixels then Draws a cyan line from (21, 144) to (449, 15).
; PLAN: r0=350(x), r1=129(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x), r6=6(y), r7=50(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x1), r11=144(y1), r12=449(x2), r13=15(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 129
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 6
LDI r7, 50
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 144
LDI r12, 449
LDI r13, 15
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
