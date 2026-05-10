; DESCRIPTION: Composite: Places a cyan line segment connecting (127, 134) to (249, 209) then Renders a red disk with center (117, 73) and radius 71.
; PLAN: r0=127(x1), r1=134(y1), r2=249(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=73(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 134
LDI r2, 249
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 73
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
