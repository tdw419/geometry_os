; DESCRIPTION: Composite: Places a green dot at position (239, 109) then Creates a black rectangular region at (242, 154) spanning 18 by 26 pixels.
; PLAN: r0=239(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=154(y), r7=18(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 242
LDI r6, 154
LDI r7, 18
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
