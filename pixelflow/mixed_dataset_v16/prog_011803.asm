; DESCRIPTION: Composite: Places a red dot at position (268, 194) then Places a blue 59x37 rectangle at position (217, 107).
; PLAN: r0=268(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=107(y), r7=59(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 217
LDI r6, 107
LDI r7, 59
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
