; DESCRIPTION: Composite: Places a black dot at position (245, 245) then Renders a black box of size 30x29 starting at (352, 180) then Renders a black disk with center (146, 79) and radius 71.
; PLAN: r0=245(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=180(y), r7=30(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=79(y), r12=71(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 352
LDI r6, 180
LDI r7, 30
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 79
LDI r12, 71
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
