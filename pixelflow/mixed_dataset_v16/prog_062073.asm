; DESCRIPTION: Composite: Renders a orange box of size 55x41 starting at (288, 107) then Sets a single purple pixel at (55, 53).
; PLAN: r0=288(x), r1=107(y), r2=55(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 107
LDI r2, 55
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
