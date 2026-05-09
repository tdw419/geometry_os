; DESCRIPTION: Composite: Draws a cyan line from (254, 98) to (278, 162) then Draws a red circle centered at (244, 124) with radius 14.
; PLAN: r0=254(x1), r1=98(y1), r2=278(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=124(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 98
LDI r2, 278
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 124
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
