; DESCRIPTION: Places a red 102x107 rectangle at position (275, 15).
; PLAN: r0=275(x), r1=15(y), r2=102(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 15
LDI r2, 102
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
