; DESCRIPTION: Composite: Renders a magenta box of size 98x95 starting at (152, 46) then Draws a white line from (46, 185) to (35, 116) then Places a yellow dot at position (337, 36).
; PLAN: r0=152(x), r1=46(y), r2=98(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x1), r6=185(y1), r7=35(x2), r8=116(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=36(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 46
LDI r2, 98
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 185
LDI r7, 35
LDI r8, 116
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 36
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
