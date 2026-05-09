; DESCRIPTION: Renders a cyan box of size 31x20 starting at (161, 87).
; PLAN: r0=161(x), r1=87(y), r2=31(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 87
LDI r2, 31
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
