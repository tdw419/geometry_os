; DESCRIPTION: Composite: Places a red dot at position (295, 13) then Places a white 94x21 rectangle at position (21, 9).
; PLAN: r0=295(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=9(y), r7=94(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 21
LDI r6, 9
LDI r7, 94
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
