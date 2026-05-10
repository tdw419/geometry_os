; DESCRIPTION: Composite: Places a red dot at position (160, 225) then Places a cyan 34x20 rectangle at position (129, 84).
; PLAN: r0=160(x), r1=225(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=84(y), r7=34(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 225
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 129
LDI r6, 84
LDI r7, 34
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
