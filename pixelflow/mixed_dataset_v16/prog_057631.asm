; DESCRIPTION: Composite: Places a blue dot at position (32, 74) then Places a purple 48x39 rectangle at position (217, 211).
; PLAN: r0=32(x), r1=74(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=211(y), r7=48(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 74
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 211
LDI r7, 48
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
