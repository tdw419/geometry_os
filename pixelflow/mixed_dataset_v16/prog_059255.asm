; DESCRIPTION: Composite: Places a cyan dot at position (197, 119) then Renders a purple line between points (160, 166) and (429, 171) then Renders a white box of size 74x62 starting at (51, 71).
; PLAN: r0=197(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=166(y1), r7=429(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=71(y), r12=74(width), r13=62(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 166
LDI r7, 429
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 71
LDI r12, 74
LDI r13, 62
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
