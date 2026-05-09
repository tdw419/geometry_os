; DESCRIPTION: Composite: Renders a green line between points (56, 7) and (292, 238) then Places a black dot at position (446, 200) then Creates a yellow rectangular region at (445, 89) spanning 27 by 60 pixels.
; PLAN: r0=56(x1), r1=7(y1), r2=292(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=200(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=445(x), r11=89(y), r12=27(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 7
LDI r2, 292
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 200
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 445
LDI r11, 89
LDI r12, 27
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
