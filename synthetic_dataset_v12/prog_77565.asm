; DESCRIPTION: Composite: Places a yellow 120x81 rectangle at position (286, 172) then Sets a single orange pixel at (440, 184).
; PLAN: r0=286(x), r1=172(y), r2=120(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 172
LDI r2, 120
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
