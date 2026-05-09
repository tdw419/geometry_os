; DESCRIPTION: Composite: Places a orange 80x81 rectangle at position (121, 171) then Sets a single purple pixel at (157, 31).
; PLAN: r0=121(x), r1=171(y), r2=80(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=31(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 171
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 31
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
