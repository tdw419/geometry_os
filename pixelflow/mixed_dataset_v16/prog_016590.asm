; DESCRIPTION: Composite: Renders a yellow box of size 20x94 starting at (262, 81) then Places a cyan dot at position (396, 23) then Draws a cyan line from (143, 243) to (75, 224).
; PLAN: r0=262(x), r1=81(y), r2=20(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=143(x1), r11=243(y1), r12=75(x2), r13=224(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 81
LDI r2, 20
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 243
LDI r12, 75
LDI r13, 224
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
