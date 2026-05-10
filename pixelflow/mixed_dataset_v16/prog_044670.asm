; DESCRIPTION: Composite: Places a orange dot at position (207, 124) then Places a blue 86x109 rectangle at position (135, 90).
; PLAN: r0=207(x), r1=124(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=90(y), r7=86(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 124
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 135
LDI r6, 90
LDI r7, 86
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
