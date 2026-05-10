; DESCRIPTION: Composite: Places a red dot at position (281, 64) then Places a magenta 51x64 rectangle at position (282, 115).
; PLAN: r0=281(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=115(y), r7=51(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 282
LDI r6, 115
LDI r7, 51
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
