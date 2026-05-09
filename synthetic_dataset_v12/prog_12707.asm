; DESCRIPTION: Places a yellow 35x38 rectangle at position (197, 139).
; PLAN: r0=197(x), r1=139(y), r2=35(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 139
LDI r2, 35
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
