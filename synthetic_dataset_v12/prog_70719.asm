; DESCRIPTION: Places a yellow 47x119 rectangle at position (309, 119).
; PLAN: r0=309(x), r1=119(y), r2=47(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 119
LDI r2, 47
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
