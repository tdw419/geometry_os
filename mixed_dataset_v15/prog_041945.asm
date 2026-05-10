; DESCRIPTION: Renders a cyan box of size 77x94 starting at (148, 34).
; PLAN: r0=148(x), r1=34(y), r2=77(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 34
LDI r2, 77
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
