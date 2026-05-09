; DESCRIPTION: Composite: Creates a red circular shape at (432, 80) with radius 37 then Sets a single cyan pixel at (161, 243) then Places a black 60x17 rectangle at position (96, 180).
; PLAN: r0=432(x), r1=80(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=243(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=180(y), r12=60(width), r13=17(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 80
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 243
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 180
LDI r12, 60
LDI r13, 17
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
