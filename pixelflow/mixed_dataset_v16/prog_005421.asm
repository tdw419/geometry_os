; DESCRIPTION: Composite: Sets a single cyan pixel at (193, 131) then Places a magenta 57x117 rectangle at position (45, 118) then Renders a black disk with center (228, 148) and radius 14.
; PLAN: r0=193(x), r1=131(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=118(y), r7=57(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x), r11=148(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 131
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 118
LDI r7, 57
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 148
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
