; DESCRIPTION: Places a yellow 44x75 rectangle at position (382, 41).
; PLAN: r0=382(x), r1=41(y), r2=44(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 41
LDI r2, 44
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
