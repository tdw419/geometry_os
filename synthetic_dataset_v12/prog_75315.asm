; DESCRIPTION: Composite: Draws a blue circle centered at (261, 111) with radius 59 then Places a cyan dot at position (367, 16) then Draws a white line from (100, 155) to (382, 236).
; PLAN: r0=261(x), r1=111(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=16(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=100(x1), r11=155(y1), r12=382(x2), r13=236(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 111
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 16
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 100
LDI r11, 155
LDI r12, 382
LDI r13, 236
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
