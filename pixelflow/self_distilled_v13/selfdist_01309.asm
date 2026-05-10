; DESCRIPTION: Creates a cyan filled rectangle of size 120x41 starting at (51, 23).
; PLAN: r0=51(x), r1=23(y), r2=120(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 23
LDI r2, 120
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
