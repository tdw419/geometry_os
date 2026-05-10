; DESCRIPTION: Composite: Renders a red box of size 71x23 starting at (291, 54) then Places a orange dot at position (182, 207).
; PLAN: r0=291(x), r1=54(y), r2=71(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=207(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 54
LDI r2, 71
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 207
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
