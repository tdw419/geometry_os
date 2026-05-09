; DESCRIPTION: Composite: Places a blue dot at position (257, 93) then Places a white 59x95 rectangle at position (433, 69).
; PLAN: r0=257(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=69(y), r7=59(width), r8=95(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 69
LDI r7, 59
LDI r8, 95
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
