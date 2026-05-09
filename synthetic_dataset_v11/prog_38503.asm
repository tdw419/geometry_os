; DESCRIPTION: Places a yellow 56x41 rectangle at position (47, 200).
; PLAN: r0=47(x), r1=200(y), r2=56(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 200
LDI r2, 56
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
