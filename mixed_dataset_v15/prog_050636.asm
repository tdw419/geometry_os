; DESCRIPTION: Composite: Renders a green box of size 66x76 starting at (171, 161) then Places a purple dot at position (357, 140) then Renders a red line between points (233, 151) and (393, 50).
; PLAN: r0=171(x), r1=161(y), r2=66(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=140(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=233(x1), r11=151(y1), r12=393(x2), r13=50(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 161
LDI r2, 66
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 140
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 151
LDI r12, 393
LDI r13, 50
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
