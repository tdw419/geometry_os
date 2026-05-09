; DESCRIPTION: Composite: Places a white dot at position (118, 84) then Places a orange 82x67 rectangle at position (113, 87).
; PLAN: r0=118(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=113(x), r6=87(y), r7=82(width), r8=67(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 87
LDI r7, 82
LDI r8, 67
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
