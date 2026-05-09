; DESCRIPTION: Composite: Places a yellow dot at position (70, 219) then Places a magenta 52x29 rectangle at position (85, 39).
; PLAN: r0=70(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=39(y), r7=52(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 85
LDI r6, 39
LDI r7, 52
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
