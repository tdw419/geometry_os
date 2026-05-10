; DESCRIPTION: Composite: Places a purple dot at position (238, 50) then Places a purple 28x58 rectangle at position (191, 99).
; PLAN: r0=238(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=99(y), r7=28(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 99
LDI r7, 28
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
