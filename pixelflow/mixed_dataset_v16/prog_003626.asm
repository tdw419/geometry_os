; DESCRIPTION: Composite: Renders a cyan line between points (320, 74) and (178, 120) then Creates a blue rectangular region at (303, 82) spanning 118 by 120 pixels then Places a cyan dot at position (195, 36).
; PLAN: r0=320(x1), r1=74(y1), r2=178(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=82(y), r7=118(width), r8=120(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x), r11=36(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 74
LDI r2, 178
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 82
LDI r7, 118
LDI r8, 120
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 36
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
