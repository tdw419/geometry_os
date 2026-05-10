; DESCRIPTION: Composite: Places a yellow 44x32 rectangle at position (330, 161) then Draws a blue circle centered at (189, 146) with radius 72.
; PLAN: r0=330(x), r1=161(y), r2=44(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=146(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 161
LDI r2, 44
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 146
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
