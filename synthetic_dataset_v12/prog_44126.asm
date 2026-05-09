; DESCRIPTION: Composite: Places a magenta dot at position (360, 37) then Renders a red box of size 43x12 starting at (52, 76).
; PLAN: r0=360(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=76(y), r7=43(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 52
LDI r6, 76
LDI r7, 43
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
