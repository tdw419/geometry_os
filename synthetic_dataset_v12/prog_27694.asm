; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 40) then Creates a cyan rectangular region at (305, 50) spanning 87 by 10 pixels.
; PLAN: r0=493(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=50(y), r7=87(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 305
LDI r6, 50
LDI r7, 87
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
