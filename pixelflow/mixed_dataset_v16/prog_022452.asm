; DESCRIPTION: Composite: Places a cyan 61x15 rectangle at position (398, 112) then Places a yellow dot at position (495, 74).
; PLAN: r0=398(x), r1=112(y), r2=61(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=74(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 112
LDI r2, 61
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 74
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
