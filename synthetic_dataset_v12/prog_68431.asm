; DESCRIPTION: Composite: Creates a red rectangular region at (326, 141) spanning 98 by 69 pixels then Renders a green line between points (66, 61) and (464, 53) then Sets a single red pixel at (245, 154).
; PLAN: r0=326(x), r1=141(y), r2=98(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=61(y1), r7=464(x2), r8=53(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=154(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 141
LDI r2, 98
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 61
LDI r7, 464
LDI r8, 53
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 154
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
