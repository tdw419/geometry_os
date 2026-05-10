; DESCRIPTION: Composite: Renders a red box of size 51x46 starting at (306, 188) then Sets a single green pixel at (180, 65).
; PLAN: r0=306(x), r1=188(y), r2=51(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=65(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 188
LDI r2, 51
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 65
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
