; DESCRIPTION: Composite: Draws a yellow line from (64, 2) to (485, 249) then Places a white circle of radius 65 at center (205, 144).
; PLAN: r0=64(x1), r1=2(y1), r2=485(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=144(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 2
LDI r2, 485
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 144
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
