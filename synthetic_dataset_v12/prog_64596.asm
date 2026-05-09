; DESCRIPTION: Composite: Renders a orange box of size 22x86 starting at (79, 72) then Places a white line segment connecting (365, 251) to (261, 76) then Renders a red disk with center (90, 111) and radius 42.
; PLAN: r0=79(x), r1=72(y), r2=22(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=251(y1), r7=261(x2), r8=76(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=111(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 72
LDI r2, 22
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 251
LDI r7, 261
LDI r8, 76
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 111
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
