; DESCRIPTION: Composite: Places a yellow dot at position (308, 4) then Renders a cyan box of size 14x63 starting at (75, 31) then Places a blue circle of radius 42 at center (451, 177).
; PLAN: r0=308(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=31(y), r7=14(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=177(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 31
LDI r7, 14
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 177
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
