; DESCRIPTION: Composite: Sets a single blue pixel at (507, 173) then Places a white 98x57 rectangle at position (301, 178) then Places a white circle of radius 44 at center (247, 210).
; PLAN: r0=507(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=178(y), r7=98(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x), r11=210(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 507
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 178
LDI r7, 98
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 210
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
