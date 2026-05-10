; DESCRIPTION: Composite: Places a blue dot at position (400, 216) then Draws a green circle centered at (437, 113) with radius 41 then Renders a green box of size 18x105 starting at (221, 91).
; PLAN: r0=400(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=113(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x), r11=91(y), r12=18(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 113
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 91
LDI r12, 18
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
