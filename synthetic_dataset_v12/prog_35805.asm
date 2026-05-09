; DESCRIPTION: Composite: Sets a single black pixel at (248, 190) then Renders a orange box of size 117x91 starting at (152, 159).
; PLAN: r0=248(x), r1=190(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=159(y), r7=117(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 190
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 152
LDI r6, 159
LDI r7, 117
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
