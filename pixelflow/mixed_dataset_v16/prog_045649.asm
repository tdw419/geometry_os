; DESCRIPTION: Composite: Places a black 33x27 rectangle at position (446, 2) then Sets a single black pixel at (248, 180) then Draws a cyan line from (384, 165) to (510, 18).
; PLAN: r0=446(x), r1=2(y), r2=33(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=384(x1), r11=165(y1), r12=510(x2), r13=18(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 2
LDI r2, 33
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 384
LDI r11, 165
LDI r12, 510
LDI r13, 18
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
