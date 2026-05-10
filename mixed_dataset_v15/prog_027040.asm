; DESCRIPTION: Composite: Creates a cyan rectangular region at (417, 6) spanning 71 by 50 pixels then Places a magenta dot at position (281, 48) then Renders a green disk with center (39, 201) and radius 33.
; PLAN: r0=417(x), r1=6(y), r2=71(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=48(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=39(x), r11=201(y), r12=33(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 6
LDI r2, 71
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 48
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 39
LDI r11, 201
LDI r12, 33
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
