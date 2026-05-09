; DESCRIPTION: Composite: Draws a cyan circle centered at (429, 156) with radius 59 then Draws a yellow line from (51, 16) to (278, 71).
; PLAN: r0=429(x), r1=156(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x1), r6=16(y1), r7=278(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 156
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 16
LDI r7, 278
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
