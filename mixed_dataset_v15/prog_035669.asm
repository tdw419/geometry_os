; DESCRIPTION: Composite: Sets a single purple pixel at (277, 5) then Renders a white box of size 113x106 starting at (368, 69) then Renders a magenta disk with center (319, 208) and radius 19.
; PLAN: r0=277(x), r1=5(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=69(y), r7=113(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=208(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 5
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 69
LDI r7, 113
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 208
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
