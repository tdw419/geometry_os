; DESCRIPTION: Composite: Renders a purple box of size 99x113 starting at (214, 23) then Sets a single red pixel at (113, 158).
; PLAN: r0=214(x), r1=23(y), r2=99(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=158(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 23
LDI r2, 99
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 158
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
