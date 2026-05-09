; DESCRIPTION: Composite: Renders a orange box of size 11x54 starting at (50, 80) then Sets a single blue pixel at (425, 84).
; PLAN: r0=50(x), r1=80(y), r2=11(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=84(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 80
LDI r2, 11
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 84
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
