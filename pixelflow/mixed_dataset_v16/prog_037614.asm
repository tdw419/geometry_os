; DESCRIPTION: Composite: Renders a black box of size 97x109 starting at (406, 110) then Sets a single black pixel at (365, 55).
; PLAN: r0=406(x), r1=110(y), r2=97(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=55(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 110
LDI r2, 97
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 55
LDI r7, 0x000000
PSET r5, r6, r7
HALT
