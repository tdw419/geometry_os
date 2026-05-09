; DESCRIPTION: Composite: Renders a red box of size 23x120 starting at (33, 122) then Sets a single orange pixel at (152, 145).
; PLAN: r0=33(x), r1=122(y), r2=23(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=145(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 122
LDI r2, 23
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 145
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
