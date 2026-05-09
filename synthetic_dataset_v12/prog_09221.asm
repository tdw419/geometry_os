; DESCRIPTION: Composite: Draws a blue line from (112, 215) to (128, 54) then Draws a yellow circle centered at (348, 173) with radius 75 then Places a cyan dot at position (210, 176).
; PLAN: r0=112(x1), r1=215(y1), r2=128(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=173(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=176(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 215
LDI r2, 128
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 173
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 176
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
