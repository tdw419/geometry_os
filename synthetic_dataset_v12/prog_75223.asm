; DESCRIPTION: Composite: Sets a single orange pixel at (505, 130) then Renders a cyan box of size 32x44 starting at (48, 68).
; PLAN: r0=505(x), r1=130(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=68(y), r7=32(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 130
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 48
LDI r6, 68
LDI r7, 32
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
