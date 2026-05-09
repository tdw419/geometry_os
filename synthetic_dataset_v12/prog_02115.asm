; DESCRIPTION: Places a blue 79x46 rectangle at position (41, 51).
; PLAN: r0=41(x), r1=51(y), r2=79(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 51
LDI r2, 79
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
