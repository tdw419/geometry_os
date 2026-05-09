; DESCRIPTION: Composite: Places a blue 15x31 rectangle at position (205, 191) then Renders a blue disk with center (65, 129) and radius 50 then Sets a single cyan pixel at (102, 139).
; PLAN: r0=205(x), r1=191(y), r2=15(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=129(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=139(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 191
LDI r2, 15
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 129
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 139
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
