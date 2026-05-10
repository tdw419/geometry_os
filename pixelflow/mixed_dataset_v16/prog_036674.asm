; DESCRIPTION: Places a purple 89x41 rectangle at position (367, 174).
; PLAN: r0=367(x), r1=174(y), r2=89(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 174
LDI r2, 89
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
