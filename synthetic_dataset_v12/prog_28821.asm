; DESCRIPTION: Composite: Sets a single red pixel at (406, 250) then Renders a white line between points (333, 71) and (402, 127) then Places a magenta 98x82 rectangle at position (12, 96).
; PLAN: r0=406(x), r1=250(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=71(y1), r7=402(x2), r8=127(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=96(y), r12=98(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 250
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 333
LDI r6, 71
LDI r7, 402
LDI r8, 127
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 96
LDI r12, 98
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
