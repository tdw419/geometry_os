; DESCRIPTION: Composite: Renders a red box of size 120x80 starting at (86, 41) then Places a yellow dot at position (370, 73) then Draws a green line from (281, 202) to (125, 110).
; PLAN: r0=86(x), r1=41(y), r2=120(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=73(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=281(x1), r11=202(y1), r12=125(x2), r13=110(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 41
LDI r2, 120
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 73
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 281
LDI r11, 202
LDI r12, 125
LDI r13, 110
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
