; DESCRIPTION: Composite: Creates a white rectangular region at (6, 108) spanning 30 by 40 pixels then Renders a green line between points (482, 210) and (59, 71) then Sets a single cyan pixel at (455, 66).
; PLAN: r0=6(x), r1=108(y), r2=30(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=210(y1), r7=59(x2), r8=71(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=66(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 108
LDI r2, 30
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 210
LDI r7, 59
LDI r8, 71
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 66
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
