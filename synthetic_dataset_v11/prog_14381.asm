; DESCRIPTION: Places a yellow 24x41 rectangle at position (221, 139).
; PLAN: r0=221(x), r1=139(y), r2=24(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 139
LDI r2, 24
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
