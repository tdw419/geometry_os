; DESCRIPTION: Places a red 39x108 rectangle at position (75, 121).
; PLAN: r0=75(x), r1=121(y), r2=39(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 121
LDI r2, 39
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
