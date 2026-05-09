; DESCRIPTION: Composite: Creates a orange rectangular region at (256, 51) spanning 21 by 32 pixels then Places a green circle of radius 15 at center (487, 58) then Places a red line segment connecting (253, 228) to (120, 245).
; PLAN: r0=256(x), r1=51(y), r2=21(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=58(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x1), r11=228(y1), r12=120(x2), r13=245(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 51
LDI r2, 21
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 58
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 228
LDI r12, 120
LDI r13, 245
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
