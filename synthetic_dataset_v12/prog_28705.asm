; DESCRIPTION: Composite: Places a white line segment connecting (28, 65) to (187, 236) then Creates a red circular shape at (48, 180) with radius 26 then Places a orange dot at position (393, 236).
; PLAN: r0=28(x1), r1=65(y1), r2=187(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=180(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=236(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 28
LDI r1, 65
LDI r2, 187
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 180
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 236
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
