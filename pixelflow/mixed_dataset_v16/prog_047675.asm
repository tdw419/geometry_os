; DESCRIPTION: Composite: Draws a magenta circle centered at (290, 154) with radius 51 then Renders a yellow box of size 39x13 starting at (247, 243) then Sets a single black pixel at (425, 16).
; PLAN: r0=290(x), r1=154(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=243(y), r7=39(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=16(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 154
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 243
LDI r7, 39
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 16
LDI r12, 0x000000
PSET r10, r11, r12
HALT
