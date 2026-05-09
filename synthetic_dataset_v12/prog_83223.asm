; DESCRIPTION: Composite: Sets a single black pixel at (42, 96) then Places a cyan 92x66 rectangle at position (74, 59) then Places a white circle of radius 11 at center (57, 27).
; PLAN: r0=42(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=59(y), r7=92(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=57(x), r11=27(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 74
LDI r6, 59
LDI r7, 92
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 27
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
