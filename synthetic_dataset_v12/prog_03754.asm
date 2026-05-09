; DESCRIPTION: Places a red 33x85 rectangle at position (475, 43).
; PLAN: r0=475(x), r1=43(y), r2=33(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 43
LDI r2, 33
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
