; DESCRIPTION: Composite: Draws a red circle centered at (212, 104) with radius 74 then Places a yellow dot at position (126, 29) then Renders a magenta box of size 99x32 starting at (27, 146).
; PLAN: r0=212(x), r1=104(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=29(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=27(x), r11=146(y), r12=99(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 104
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 29
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 27
LDI r11, 146
LDI r12, 99
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
