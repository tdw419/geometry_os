; DESCRIPTION: Composite: Sets a single white pixel at (21, 8) then Draws a red circle centered at (428, 132) with radius 54 then Renders a cyan line between points (90, 211) and (121, 236).
; PLAN: r0=21(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=132(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x1), r11=211(y1), r12=121(x2), r13=236(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 132
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 211
LDI r12, 121
LDI r13, 236
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
