; DESCRIPTION: Composite: Sets a single purple pixel at (210, 236) then Draws a yellow rectangle at (190, 180) with width 76 and height 16 then Renders a white line between points (39, 94) and (493, 202).
; PLAN: r0=210(x), r1=236(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=180(y), r7=76(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x1), r11=94(y1), r12=493(x2), r13=202(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 236
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 180
LDI r7, 76
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 94
LDI r12, 493
LDI r13, 202
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
