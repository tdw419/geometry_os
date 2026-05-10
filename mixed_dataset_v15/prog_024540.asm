; DESCRIPTION: Composite: Places a green 116x87 rectangle at position (24, 135) then Places a red dot at position (424, 20).
; PLAN: r0=24(x), r1=135(y), r2=116(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=20(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 135
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 20
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
