; DESCRIPTION: Places a yellow 25x41 rectangle at position (230, 108).
; PLAN: r0=230(x), r1=108(y), r2=25(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 108
LDI r2, 25
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
