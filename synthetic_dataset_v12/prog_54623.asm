; DESCRIPTION: Composite: Places a green dot at position (168, 49) then Places a white circle of radius 58 at center (203, 111).
; PLAN: r0=168(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=111(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 203
LDI r6, 111
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
