; DESCRIPTION: Composite: Renders a purple box of size 79x76 starting at (340, 43) then Places a cyan dot at position (418, 117).
; PLAN: r0=340(x), r1=43(y), r2=79(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 43
LDI r2, 79
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
