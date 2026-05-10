; DESCRIPTION: Composite: Places a orange 75x96 rectangle at position (41, 125) then Places a red dot at position (305, 103).
; PLAN: r0=41(x), r1=125(y), r2=75(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 125
LDI r2, 75
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
