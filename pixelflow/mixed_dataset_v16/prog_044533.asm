; DESCRIPTION: Composite: Places a red 105x81 rectangle at position (60, 14) then Places a magenta dot at position (352, 51).
; PLAN: r0=60(x), r1=14(y), r2=105(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 14
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
