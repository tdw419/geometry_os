; DESCRIPTION: Composite: Draws a black line from (373, 30) to (327, 140) then Renders a white box of size 105x43 starting at (134, 57).
; PLAN: r0=373(x1), r1=30(y1), r2=327(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=57(y), r7=105(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 30
LDI r2, 327
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 57
LDI r7, 105
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
