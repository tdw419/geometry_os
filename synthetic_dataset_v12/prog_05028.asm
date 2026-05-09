; DESCRIPTION: Composite: Places a green dot at position (346, 109) then Creates a cyan rectangular region at (269, 15) spanning 87 by 48 pixels.
; PLAN: r0=346(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=15(y), r7=87(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 15
LDI r7, 87
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
