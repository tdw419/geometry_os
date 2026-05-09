; DESCRIPTION: Composite: Renders a green box of size 22x43 starting at (361, 125) then Sets a single white pixel at (13, 60) then Renders a cyan line between points (90, 152) and (470, 24).
; PLAN: r0=361(x), r1=125(y), r2=22(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=60(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=90(x1), r11=152(y1), r12=470(x2), r13=24(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 125
LDI r2, 22
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 60
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 152
LDI r12, 470
LDI r13, 24
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
