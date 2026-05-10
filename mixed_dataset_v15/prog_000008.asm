; DESCRIPTION: Composite: Draws a cyan line from (475, 155) to (436, 185) then Renders a yellow box of size 42x103 starting at (383, 138).
; PLAN: r0=475(x1), r1=155(y1), r2=436(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=138(y), r7=42(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 155
LDI r2, 436
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 138
LDI r7, 42
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
