; DESCRIPTION: Renders a cyan box of size 73x97 starting at (123, 51).
; PLAN: r0=123(x), r1=51(y), r2=73(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 51
LDI r2, 73
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
