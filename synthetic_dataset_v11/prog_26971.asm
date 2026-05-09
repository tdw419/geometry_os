; DESCRIPTION: Places a yellow 80x77 rectangle at position (129, 41).
; PLAN: r0=129(x), r1=41(y), r2=80(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 41
LDI r2, 80
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
