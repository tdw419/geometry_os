; DESCRIPTION: Places a black 89x46 rectangle at position (213, 112).
; PLAN: r0=213(x), r1=112(y), r2=89(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 112
LDI r2, 89
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
