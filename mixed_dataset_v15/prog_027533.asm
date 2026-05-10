; DESCRIPTION: Composite: Creates a red rectangular region at (445, 189) spanning 10 by 10 pixels then Renders a white line between points (207, 209) and (37, 28) then Sets a single white pixel at (368, 146).
; PLAN: r0=445(x), r1=189(y), r2=10(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=209(y1), r7=37(x2), r8=28(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=146(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 189
LDI r2, 10
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 209
LDI r7, 37
LDI r8, 28
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 146
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
