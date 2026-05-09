; DESCRIPTION: Composite: Places a yellow dot at position (255, 50) then Renders a orange box of size 83x56 starting at (241, 179).
; PLAN: r0=255(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=179(y), r7=83(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 241
LDI r6, 179
LDI r7, 83
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
