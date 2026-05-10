; DESCRIPTION: Composite: Sets a single cyan pixel at (91, 187) then Creates a orange rectangular region at (213, 44) spanning 28 by 71 pixels then Places a yellow line segment connecting (500, 131) to (434, 111).
; PLAN: r0=91(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=44(y), r7=28(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x1), r11=131(y1), r12=434(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 44
LDI r7, 28
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 131
LDI r12, 434
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
