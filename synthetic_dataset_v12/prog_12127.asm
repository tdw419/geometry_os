; DESCRIPTION: Places a red 39x107 rectangle at position (361, 149).
; PLAN: r0=361(x), r1=149(y), r2=39(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 149
LDI r2, 39
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
