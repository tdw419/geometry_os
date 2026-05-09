; DESCRIPTION: Composite: Places a magenta dot at position (46, 211) then Draws a red circle centered at (399, 170) with radius 62 then Draws a cyan line from (86, 223) to (443, 68).
; PLAN: r0=46(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=170(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=86(x1), r11=223(y1), r12=443(x2), r13=68(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 170
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 86
LDI r11, 223
LDI r12, 443
LDI r13, 68
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
