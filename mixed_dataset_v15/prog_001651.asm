; DESCRIPTION: Composite: Places a green 106x89 rectangle at position (406, 25) then Places a red dot at position (140, 31) then Places a white circle of radius 76 at center (405, 109).
; PLAN: r0=406(x), r1=25(y), r2=106(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=31(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=109(y), r12=76(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 406
LDI r1, 25
LDI r2, 106
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 31
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 405
LDI r11, 109
LDI r12, 76
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
