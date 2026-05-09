; DESCRIPTION: Composite: Places a purple 16x48 rectangle at position (83, 130) then Places a cyan dot at position (476, 50).
; PLAN: r0=83(x), r1=130(y), r2=16(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=50(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 130
LDI r2, 16
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 50
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
