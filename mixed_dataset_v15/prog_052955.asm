; DESCRIPTION: Composite: Creates a purple rectangular region at (293, 124) spanning 105 by 70 pixels then Places a cyan dot at position (61, 143).
; PLAN: r0=293(x), r1=124(y), r2=105(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 124
LDI r2, 105
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
