; DESCRIPTION: Composite: Places a orange dot at position (96, 44) then Renders a black box of size 38x65 starting at (43, 86).
; PLAN: r0=96(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=86(y), r7=38(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 43
LDI r6, 86
LDI r7, 38
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
