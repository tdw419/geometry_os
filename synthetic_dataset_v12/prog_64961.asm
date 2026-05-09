; DESCRIPTION: Composite: Draws a cyan line from (416, 248) to (356, 223) then Draws a yellow rectangle at (115, 87) with width 34 and height 99 then Sets a single red pixel at (39, 103).
; PLAN: r0=416(x1), r1=248(y1), r2=356(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=87(y), r7=34(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=103(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 248
LDI r2, 356
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 87
LDI r7, 34
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 103
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
