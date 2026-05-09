; DESCRIPTION: Composite: Places a white circle of radius 37 at center (308, 205) then Renders a purple box of size 98x111 starting at (198, 40) then Places a white dot at position (105, 174).
; PLAN: r0=308(x), r1=205(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=40(y), r7=98(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=174(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 205
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 40
LDI r7, 98
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 174
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
