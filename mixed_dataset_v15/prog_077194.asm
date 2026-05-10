; DESCRIPTION: Composite: Places a black dot at position (498, 174) then Renders a magenta box of size 97x90 starting at (300, 31) then Renders a magenta disk with center (66, 151) and radius 22.
; PLAN: r0=498(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=31(y), r7=97(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x), r11=151(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 31
LDI r7, 97
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 151
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
