; DESCRIPTION: Composite: Creates a white circular shape at (439, 74) with radius 70 then Draws a yellow line from (236, 218) to (485, 120) then Places a yellow dot at position (42, 253).
; PLAN: r0=439(x), r1=74(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x1), r6=218(y1), r7=485(x2), r8=120(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=253(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 74
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 218
LDI r7, 485
LDI r8, 120
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 253
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
