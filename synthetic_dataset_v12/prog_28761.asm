; DESCRIPTION: Composite: Draws a blue rectangle at (234, 202) with width 50 and height 47 then Sets a single cyan pixel at (317, 71) then Renders a green line between points (52, 28) and (46, 135).
; PLAN: r0=234(x), r1=202(y), r2=50(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=71(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=52(x1), r11=28(y1), r12=46(x2), r13=135(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 202
LDI r2, 50
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 71
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 52
LDI r11, 28
LDI r12, 46
LDI r13, 135
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
