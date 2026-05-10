; DESCRIPTION: Composite: Draws a cyan line from (43, 9) to (386, 177) then Draws a purple circle centered at (487, 39) with radius 15.
; PLAN: r0=43(x1), r1=9(y1), r2=386(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=39(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 9
LDI r2, 386
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 39
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
