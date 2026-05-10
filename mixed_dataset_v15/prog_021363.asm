; DESCRIPTION: Composite: Draws a red circle centered at (279, 103) with radius 47 then Places a orange dot at position (250, 67) then Draws a white line from (171, 162) to (494, 224).
; PLAN: r0=279(x), r1=103(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=171(x1), r11=162(y1), r12=494(x2), r13=224(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 103
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 171
LDI r11, 162
LDI r12, 494
LDI r13, 224
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
