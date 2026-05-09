; DESCRIPTION: Composite: Renders a magenta disk with center (87, 46) and radius 30 then Draws a white line from (377, 33) to (213, 42) then Sets a single orange pixel at (370, 102).
; PLAN: r0=87(x), r1=46(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=33(y1), r7=213(x2), r8=42(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=102(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 46
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 33
LDI r7, 213
LDI r8, 42
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 102
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
