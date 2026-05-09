; DESCRIPTION: Creates a cyan rectangular region at (125, 51) spanning 41 by 105 pixels.
; PLAN: r0=125(x), r1=51(y), r2=41(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 51
LDI r2, 41
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
