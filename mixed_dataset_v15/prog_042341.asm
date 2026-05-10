; DESCRIPTION: Composite: Renders a cyan disk with center (237, 195) and radius 55 then Draws a yellow line from (409, 82) to (362, 152) then Sets a single white pixel at (372, 190).
; PLAN: r0=237(x), r1=195(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=82(y1), r7=362(x2), r8=152(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=190(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 195
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 82
LDI r7, 362
LDI r8, 152
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 190
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
