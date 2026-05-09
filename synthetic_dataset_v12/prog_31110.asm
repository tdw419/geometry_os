; DESCRIPTION: Composite: Renders a cyan disk with center (323, 161) and radius 29 then Places a purple dot at position (172, 33) then Draws a magenta line from (160, 226) to (275, 183).
; PLAN: r0=323(x), r1=161(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=33(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=160(x1), r11=226(y1), r12=275(x2), r13=183(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 161
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 33
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 160
LDI r11, 226
LDI r12, 275
LDI r13, 183
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
