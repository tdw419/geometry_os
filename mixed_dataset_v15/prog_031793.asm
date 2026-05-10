; DESCRIPTION: Composite: Renders a white box of size 87x76 starting at (281, 120) then Sets a single red pixel at (158, 46).
; PLAN: r0=281(x), r1=120(y), r2=87(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 120
LDI r2, 87
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
