; DESCRIPTION: Composite: Renders a green box of size 74x65 starting at (320, 8) then Places a yellow dot at position (431, 188).
; PLAN: r0=320(x), r1=8(y), r2=74(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=188(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 8
LDI r2, 74
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 188
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
