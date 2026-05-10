; DESCRIPTION: Composite: Places a black 11x90 rectangle at position (184, 120) then Places a cyan dot at position (402, 253).
; PLAN: r0=184(x), r1=120(y), r2=11(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=253(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 120
LDI r2, 11
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 253
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
