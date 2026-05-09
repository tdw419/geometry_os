; DESCRIPTION: Composite: Places a cyan circle of radius 16 at center (477, 72) then Draws a yellow line from (56, 151) to (385, 244).
; PLAN: r0=477(x), r1=72(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x1), r6=151(y1), r7=385(x2), r8=244(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 72
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 151
LDI r7, 385
LDI r8, 244
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
