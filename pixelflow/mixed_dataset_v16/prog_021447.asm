; DESCRIPTION: Composite: Draws a green line from (407, 79) to (103, 124) then Renders a orange disk with center (329, 75) and radius 69 then Places a cyan dot at position (441, 219).
; PLAN: r0=407(x1), r1=79(y1), r2=103(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=75(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=219(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 79
LDI r2, 103
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 75
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 219
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
