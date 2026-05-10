; DESCRIPTION: Renders a cyan box of size 56x51 starting at (355, 161).
; PLAN: r0=355(x), r1=161(y), r2=56(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 161
LDI r2, 56
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
