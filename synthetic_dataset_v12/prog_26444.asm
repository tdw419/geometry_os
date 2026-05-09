; DESCRIPTION: Composite: Sets a single orange pixel at (446, 121) then Renders a red box of size 99x87 starting at (62, 70).
; PLAN: r0=446(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=70(y), r7=99(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 62
LDI r6, 70
LDI r7, 99
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
