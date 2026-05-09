; DESCRIPTION: Composite: Draws a blue circle centered at (121, 45) with radius 14 then Places a cyan 96x41 rectangle at position (103, 37) then Places a yellow dot at position (243, 65).
; PLAN: r0=121(x), r1=45(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=37(y), r7=96(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=65(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 45
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 37
LDI r7, 96
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 65
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
