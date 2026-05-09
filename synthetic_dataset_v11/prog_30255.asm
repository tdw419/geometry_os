; DESCRIPTION: Places a red 33x41 rectangle at position (106, 107).
; PLAN: r0=106(x), r1=107(y), r2=33(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 107
LDI r2, 33
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
