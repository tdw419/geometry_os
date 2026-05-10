; DESCRIPTION: Composite: Places a blue dot at position (365, 109) then Renders a magenta box of size 62x66 starting at (91, 0) then Places a magenta circle of radius 54 at center (439, 61).
; PLAN: r0=365(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=91(x), r6=0(y), r7=62(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=61(y), r12=54(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 91
LDI r6, 0
LDI r7, 62
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 61
LDI r12, 54
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
