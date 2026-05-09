; DESCRIPTION: Composite: Places a orange 38x83 rectangle at position (465, 44) then Places a red dot at position (6, 205) then Places a magenta circle of radius 34 at center (46, 83).
; PLAN: r0=465(x), r1=44(y), r2=38(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=205(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=83(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 44
LDI r2, 38
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 205
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 46
LDI r11, 83
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
