; DESCRIPTION: Composite: . Then Renders a black disk with center (106, 143) and radius 80. Then Renders a orange box of size 92x116 starting at (147, 111).
; PLAN: r0=106(x), r1=143(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=111(y), r2=92(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (106, 143) and radius 80.
; PLAN: r0=106(x), r1=143(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 143
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 92x116 starting at (147, 111).
; PLAN: r0=147(x), r1=111(y), r2=92(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 111
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
