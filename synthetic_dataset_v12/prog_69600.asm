; DESCRIPTION: Composite: Places a orange circle of radius 47 at center (368, 74) then Places a green 24x85 rectangle at position (202, 166) then Sets a single purple pixel at (187, 235).
; PLAN: r0=368(x), r1=74(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=166(y), r7=24(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=235(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 74
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 166
LDI r7, 24
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 235
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
