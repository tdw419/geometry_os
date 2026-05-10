; DESCRIPTION: Composite: Places a red dot at position (66, 98) then Renders a white box of size 57x25 starting at (207, 95) then Places a black circle of radius 36 at center (92, 146).
; PLAN: r0=66(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=95(y), r7=57(width), r8=25(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=146(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 95
LDI r7, 57
LDI r8, 25
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 146
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
