; DESCRIPTION: Composite: Places a black dot at position (414, 33) then Places a orange 24x70 rectangle at position (48, 5).
; PLAN: r0=414(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=5(y), r7=24(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 48
LDI r6, 5
LDI r7, 24
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
