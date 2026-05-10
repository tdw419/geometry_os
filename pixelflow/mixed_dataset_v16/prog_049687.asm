; DESCRIPTION: Composite: Creates a black rectangular region at (251, 99) spanning 99 by 22 pixels then Places a cyan dot at position (465, 44).
; PLAN: r0=251(x), r1=99(y), r2=99(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=44(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 99
LDI r2, 99
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 44
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
