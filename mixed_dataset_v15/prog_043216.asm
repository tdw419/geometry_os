; DESCRIPTION: Composite: Sets a single cyan pixel at (170, 67) then Creates a red rectangular region at (372, 17) spanning 32 by 109 pixels.
; PLAN: r0=170(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=17(y), r7=32(width), r8=109(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 17
LDI r7, 32
LDI r8, 109
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
