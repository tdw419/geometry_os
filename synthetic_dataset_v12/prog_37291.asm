; DESCRIPTION: Composite: Places a orange circle of radius 30 at center (50, 108) then Renders a orange box of size 83x44 starting at (119, 61).
; PLAN: r0=50(x), r1=108(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=61(y), r7=83(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 108
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 61
LDI r7, 83
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
