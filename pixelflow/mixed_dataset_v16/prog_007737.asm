; DESCRIPTION: Composite: Renders a red box of size 28x53 starting at (103, 0) then Sets a single orange pixel at (231, 122).
; PLAN: r0=103(x), r1=0(y), r2=28(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=122(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 0
LDI r2, 28
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 122
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
