; DESCRIPTION: Composite: Renders a black box of size 51x91 starting at (5, 122) then Draws a red line from (27, 98) to (246, 242).
; PLAN: r0=5(x), r1=122(y), r2=51(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=98(y1), r7=246(x2), r8=242(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 122
LDI r2, 51
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 98
LDI r7, 246
LDI r8, 242
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
