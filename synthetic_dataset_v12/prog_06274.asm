; DESCRIPTION: Composite: Renders a orange box of size 117x65 starting at (329, 76) then Places a red dot at position (354, 171).
; PLAN: r0=329(x), r1=76(y), r2=117(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=171(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 76
LDI r2, 117
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 171
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
