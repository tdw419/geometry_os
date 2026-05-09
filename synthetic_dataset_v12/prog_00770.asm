; DESCRIPTION: Composite: Draws a magenta circle centered at (108, 65) with radius 44 then Places a red dot at position (384, 168) then Places a black 73x29 rectangle at position (193, 220).
; PLAN: r0=108(x), r1=65(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=168(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=193(x), r11=220(y), r12=73(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 65
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 168
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 193
LDI r11, 220
LDI r12, 73
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
