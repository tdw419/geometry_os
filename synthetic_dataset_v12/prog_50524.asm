; DESCRIPTION: Renders a cyan box of size 41x33 starting at (471, 187).
; PLAN: r0=471(x), r1=187(y), r2=41(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 187
LDI r2, 41
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
