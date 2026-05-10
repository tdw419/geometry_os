; DESCRIPTION: Renders a white rectangular region spanning 36 by 55 at (45, 111).
; PLAN: r0=45(x), r1=111(y), r2=36(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 111
LDI r2, 36
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
