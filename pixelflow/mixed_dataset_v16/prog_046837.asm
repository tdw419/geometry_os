; DESCRIPTION: Composite: Renders a magenta line between points (129, 213) and (231, 247) then Creates a magenta circular shape at (214, 205) with radius 47 then Places a green dot at position (491, 43).
; PLAN: r0=129(x1), r1=213(y1), r2=231(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=205(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=491(x), r11=43(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 213
LDI r2, 231
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 205
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 491
LDI r11, 43
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
