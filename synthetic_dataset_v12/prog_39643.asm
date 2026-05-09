; DESCRIPTION: Places a black 111x27 rectangle at position (46, 41).
; PLAN: r0=46(x), r1=41(y), r2=111(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 41
LDI r2, 111
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
