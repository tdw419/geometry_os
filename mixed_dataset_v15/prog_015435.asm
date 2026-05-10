; DESCRIPTION: Composite: Draws a green line from (497, 35) to (509, 200) then Places a red dot at position (105, 121) then Places a cyan 66x15 rectangle at position (109, 0).
; PLAN: r0=497(x1), r1=35(y1), r2=509(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=121(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=0(y), r12=66(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 35
LDI r2, 509
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 121
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 109
LDI r11, 0
LDI r12, 66
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
