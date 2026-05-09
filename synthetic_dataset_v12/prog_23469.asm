; DESCRIPTION: Composite: Creates a magenta rectangular region at (140, 155) spanning 39 by 38 pixels then Renders a purple line between points (487, 151) and (85, 223) then Places a cyan dot at position (507, 231).
; PLAN: r0=140(x), r1=155(y), r2=39(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x1), r6=151(y1), r7=85(x2), r8=223(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=231(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 155
LDI r2, 39
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 151
LDI r7, 85
LDI r8, 223
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 231
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
