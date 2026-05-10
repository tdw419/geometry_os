; DESCRIPTION: Composite: Creates a cyan rectangular region at (127, 50) spanning 61 by 12 pixels then Places a magenta circle of radius 11 at center (178, 242) then Renders a green line between points (372, 153) and (41, 189).
; PLAN: r0=127(x), r1=50(y), r2=61(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=242(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=372(x1), r11=153(y1), r12=41(x2), r13=189(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 50
LDI r2, 61
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 242
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 372
LDI r11, 153
LDI r12, 41
LDI r13, 189
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
