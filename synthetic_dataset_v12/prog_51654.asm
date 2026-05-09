; DESCRIPTION: Composite: Places a green dot at position (475, 190) then Renders a yellow box of size 38x92 starting at (423, 1).
; PLAN: r0=475(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=1(y), r7=38(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 1
LDI r7, 38
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
