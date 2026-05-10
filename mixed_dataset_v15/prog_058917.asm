; DESCRIPTION: Composite: Renders a yellow box of size 65x88 starting at (306, 115) then Places a white dot at position (237, 220).
; PLAN: r0=306(x), r1=115(y), r2=65(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 115
LDI r2, 65
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
