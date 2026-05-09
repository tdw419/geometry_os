; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (190, 171) then Draws a yellow line from (457, 126) to (236, 250).
; PLAN: r0=190(x), r1=171(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x1), r6=126(y1), r7=236(x2), r8=250(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 171
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 126
LDI r7, 236
LDI r8, 250
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
