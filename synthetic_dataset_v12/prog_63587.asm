; DESCRIPTION: Composite: Creates a cyan circular shape at (299, 152) with radius 67 then Sets a single red pixel at (254, 247) then Draws a red line from (114, 46) to (396, 27).
; PLAN: r0=299(x), r1=152(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=247(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=114(x1), r11=46(y1), r12=396(x2), r13=27(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 152
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 247
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 114
LDI r11, 46
LDI r12, 396
LDI r13, 27
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
