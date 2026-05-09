; DESCRIPTION: Composite: Renders a green line between points (416, 247) and (181, 130) then Places a cyan 84x85 rectangle at position (347, 39) then Places a cyan dot at position (240, 225).
; PLAN: r0=416(x1), r1=247(y1), r2=181(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=39(y), r7=84(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x), r11=225(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 247
LDI r2, 181
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 39
LDI r7, 84
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 225
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
