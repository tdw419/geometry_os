; DESCRIPTION: Composite: Draws a white line from (310, 40) to (460, 138) then Places a red dot at position (354, 254) then Renders a orange box of size 115x34 starting at (66, 130).
; PLAN: r0=310(x1), r1=40(y1), r2=460(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=254(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=130(y), r12=115(width), r13=34(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 40
LDI r2, 460
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 254
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 66
LDI r11, 130
LDI r12, 115
LDI r13, 34
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
