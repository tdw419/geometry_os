; DESCRIPTION: Composite: Places a cyan 117x41 rectangle at position (160, 132) then Renders a green disk with center (228, 146) and radius 70 then Sets a single black pixel at (432, 61).
; PLAN: r0=160(x), r1=132(y), r2=117(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=146(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x), r11=61(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 132
LDI r2, 117
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 146
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 61
LDI r12, 0x000000
PSET r10, r11, r12
HALT
