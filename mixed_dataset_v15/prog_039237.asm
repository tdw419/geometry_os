; DESCRIPTION: Composite: Places a red dot at position (402, 20) then Places a orange 33x21 rectangle at position (129, 24).
; PLAN: r0=402(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=24(y), r7=33(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 129
LDI r6, 24
LDI r7, 33
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
