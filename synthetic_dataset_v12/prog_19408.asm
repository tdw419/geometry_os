; DESCRIPTION: Composite: Places a orange dot at position (256, 192) then Renders a black line between points (305, 15) and (238, 21).
; PLAN: r0=256(x), r1=192(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=15(y1), r7=238(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 192
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 305
LDI r6, 15
LDI r7, 238
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
