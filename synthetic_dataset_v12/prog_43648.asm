; DESCRIPTION: Composite: Places a red line segment connecting (168, 209) to (12, 68) then Draws a cyan circle centered at (211, 168) with radius 24 then Creates a yellow rectangular region at (104, 165) spanning 16 by 32 pixels.
; PLAN: r0=168(x1), r1=209(y1), r2=12(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=168(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=165(y), r12=16(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 209
LDI r2, 12
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 168
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 165
LDI r12, 16
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
