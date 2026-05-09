; DESCRIPTION: Composite: Renders a orange box of size 27x43 starting at (429, 80) then Places a black line segment connecting (11, 165) to (470, 241) then Places a magenta dot at position (425, 202).
; PLAN: r0=429(x), r1=80(y), r2=27(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=165(y1), r7=470(x2), r8=241(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=202(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 80
LDI r2, 27
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 165
LDI r7, 470
LDI r8, 241
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 202
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
