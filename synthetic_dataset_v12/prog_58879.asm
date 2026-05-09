; DESCRIPTION: Composite: Renders a black line between points (468, 152) and (374, 39) then Places a cyan 64x46 rectangle at position (7, 138) then Places a red dot at position (382, 38).
; PLAN: r0=468(x1), r1=152(y1), r2=374(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=138(y), r7=64(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=38(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 468
LDI r1, 152
LDI r2, 374
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 138
LDI r7, 64
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 38
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
