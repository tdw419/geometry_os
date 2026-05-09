; DESCRIPTION: Composite: Places a yellow dot at position (242, 44) then Draws a green line from (63, 86) to (306, 52) then Creates a red rectangular region at (154, 100) spanning 63 by 18 pixels.
; PLAN: r0=242(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=86(y1), r7=306(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=100(y), r12=63(width), r13=18(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 63
LDI r6, 86
LDI r7, 306
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 100
LDI r12, 63
LDI r13, 18
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
