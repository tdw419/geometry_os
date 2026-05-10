; DESCRIPTION: Composite: Creates a white rectangular region at (101, 12) spanning 42 by 99 pixels then Draws a yellow line from (207, 112) to (407, 71) then Places a white dot at position (435, 27).
; PLAN: r0=101(x), r1=12(y), r2=42(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=112(y1), r7=407(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=27(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 12
LDI r2, 42
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 112
LDI r7, 407
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 27
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
