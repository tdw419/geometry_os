; DESCRIPTION: Composite: Draws a yellow line from (377, 239) to (340, 177) then Renders a black box of size 119x77 starting at (191, 107).
; PLAN: r0=377(x1), r1=239(y1), r2=340(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=107(y), r7=119(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 239
LDI r2, 340
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 107
LDI r7, 119
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
