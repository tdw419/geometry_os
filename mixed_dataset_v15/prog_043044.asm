; DESCRIPTION: Composite: Creates a blue rectangular region at (217, 1) spanning 80 by 18 pixels then Draws a white line from (439, 151) to (240, 46) then Sets a single cyan pixel at (305, 112).
; PLAN: r0=217(x), r1=1(y), r2=80(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=151(y1), r7=240(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=112(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 1
LDI r2, 80
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 151
LDI r7, 240
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 112
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
