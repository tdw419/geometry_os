; DESCRIPTION: Composite: Places a red 112x55 rectangle at position (342, 146) then Places a purple dot at position (465, 64).
; PLAN: r0=342(x), r1=146(y), r2=112(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=64(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 146
LDI r2, 112
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 64
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
