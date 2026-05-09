; DESCRIPTION: Composite: Places a cyan line segment connecting (392, 229) to (274, 242) then Draws a yellow circle centered at (291, 160) with radius 79.
; PLAN: r0=392(x1), r1=229(y1), r2=274(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=160(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 229
LDI r2, 274
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 160
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
