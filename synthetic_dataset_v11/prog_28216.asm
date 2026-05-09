; DESCRIPTION: Composite: . Then Places a black dot at position (152, 69). Then Places a black 28x41 rectangle at position (88, 159).
; PLAN: r0=152(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=88(x), r1=159(y), r2=28(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (152, 69).
; PLAN: r0=152(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a black 28x41 rectangle at position (88, 159).
; PLAN: r0=88(x), r1=159(y), r2=28(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 159
LDI r2, 28
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
