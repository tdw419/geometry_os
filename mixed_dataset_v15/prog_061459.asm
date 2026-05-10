; DESCRIPTION: Composite: Draws a cyan line from (92, 168) to (348, 205) then Places a orange dot at position (61, 46) then Places a green circle of radius 63 at center (368, 83).
; PLAN: r0=92(x1), r1=168(y1), r2=348(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=46(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=83(y), r12=63(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 168
LDI r2, 348
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 46
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 368
LDI r11, 83
LDI r12, 63
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
