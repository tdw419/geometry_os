; DESCRIPTION: Composite: Draws a cyan line from (310, 253) to (120, 12) then Draws a orange circle centered at (421, 187) with radius 65.
; PLAN: r0=310(x1), r1=253(y1), r2=120(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=187(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 253
LDI r2, 120
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 187
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
