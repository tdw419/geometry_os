; DESCRIPTION: Composite: Renders a yellow box of size 113x55 starting at (46, 51) then Sets a single black pixel at (510, 101).
; PLAN: r0=46(x), r1=51(y), r2=113(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x), r6=101(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 51
LDI r2, 113
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 101
LDI r7, 0x000000
PSET r5, r6, r7
HALT
