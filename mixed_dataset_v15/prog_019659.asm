; DESCRIPTION: Renders a cyan box of size 51x35 starting at (438, 118).
; PLAN: r0=438(x), r1=118(y), r2=51(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 118
LDI r2, 51
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
