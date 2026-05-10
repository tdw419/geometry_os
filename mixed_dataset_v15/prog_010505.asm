; DESCRIPTION: Composite: Places a cyan 46x59 rectangle at position (80, 104) then Renders a black line between points (196, 61) and (278, 226) then Sets a single green pixel at (397, 41).
; PLAN: r0=80(x), r1=104(y), r2=46(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x1), r6=61(y1), r7=278(x2), r8=226(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 104
LDI r2, 46
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 61
LDI r7, 278
LDI r8, 226
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
