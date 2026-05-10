; DESCRIPTION: Composite: Sets a single green pixel at (337, 243) then Draws a magenta line from (113, 193) to (467, 77) then Draws a white circle centered at (374, 161) with radius 54.
; PLAN: r0=337(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=113(x1), r6=193(y1), r7=467(x2), r8=77(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=161(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 113
LDI r6, 193
LDI r7, 467
LDI r8, 77
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 161
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
