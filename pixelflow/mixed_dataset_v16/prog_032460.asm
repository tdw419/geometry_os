; DESCRIPTION: Composite: Draws a red line from (492, 67) to (190, 29) then Places a cyan circle of radius 11 at center (19, 28).
; PLAN: r0=492(x1), r1=67(y1), r2=190(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=28(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 67
LDI r2, 190
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 28
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
