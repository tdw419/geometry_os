; DESCRIPTION: Places a white 41x105 box at position (369, 20).
; PLAN: r0=369(x), r1=20(y), r2=41(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 20
LDI r2, 41
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
