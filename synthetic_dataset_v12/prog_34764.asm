; DESCRIPTION: Composite: Creates a cyan rectangular region at (276, 30) spanning 25 by 80 pixels then Renders a red line between points (341, 215) and (337, 154) then Places a magenta dot at position (394, 132).
; PLAN: r0=276(x), r1=30(y), r2=25(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=215(y1), r7=337(x2), r8=154(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=132(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 30
LDI r2, 25
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 215
LDI r7, 337
LDI r8, 154
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 132
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
