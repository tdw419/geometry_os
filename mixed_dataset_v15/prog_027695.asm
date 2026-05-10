; DESCRIPTION: Composite: Sets a single orange pixel at (367, 196) then Creates a orange circular shape at (450, 236) with radius 15 then Draws a white line from (69, 142) to (16, 80).
; PLAN: r0=367(x), r1=196(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=236(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x1), r11=142(y1), r12=16(x2), r13=80(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 196
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 450
LDI r6, 236
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 142
LDI r12, 16
LDI r13, 80
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
