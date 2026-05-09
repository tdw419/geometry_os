; DESCRIPTION: Composite: Places a purple dot at position (224, 176) then Renders a white box of size 39x38 starting at (50, 189).
; PLAN: r0=224(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=189(y), r7=39(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 189
LDI r7, 39
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
