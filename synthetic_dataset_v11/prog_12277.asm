; DESCRIPTION: Renders a cyan box of size 102x107 starting at (106, 131).
; PLAN: r0=106(x), r1=131(y), r2=102(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 131
LDI r2, 102
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
