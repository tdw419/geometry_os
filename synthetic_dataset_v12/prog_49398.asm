; DESCRIPTION: Renders a cyan box of size 38x51 starting at (34, 140).
; PLAN: r0=34(x), r1=140(y), r2=38(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 140
LDI r2, 38
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
