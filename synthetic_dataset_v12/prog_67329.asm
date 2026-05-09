; DESCRIPTION: Composite: Places a cyan dot at position (209, 202) then Creates a yellow rectangular region at (45, 108) spanning 70 by 105 pixels.
; PLAN: r0=209(x), r1=202(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=108(y), r7=70(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 202
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 108
LDI r7, 70
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
