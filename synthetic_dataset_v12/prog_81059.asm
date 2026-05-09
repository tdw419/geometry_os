; DESCRIPTION: Composite: Places a blue dot at position (64, 214) then Places a purple 71x114 rectangle at position (352, 123).
; PLAN: r0=64(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=123(y), r7=71(width), r8=114(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 123
LDI r7, 71
LDI r8, 114
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
