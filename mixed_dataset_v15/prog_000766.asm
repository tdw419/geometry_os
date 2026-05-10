; DESCRIPTION: Composite: Places a white dot at position (492, 225) then Places a orange 57x16 rectangle at position (53, 47).
; PLAN: r0=492(x), r1=225(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=47(y), r7=57(width), r8=16(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 225
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 47
LDI r7, 57
LDI r8, 16
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
