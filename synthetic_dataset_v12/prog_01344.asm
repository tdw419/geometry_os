; DESCRIPTION: Composite: Renders a orange box of size 99x91 starting at (166, 135) then Sets a single orange pixel at (419, 242).
; PLAN: r0=166(x), r1=135(y), r2=99(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 135
LDI r2, 99
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
