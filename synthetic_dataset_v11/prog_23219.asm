; DESCRIPTION: Renders a cyan box of size 110x34 starting at (71, 193).
; PLAN: r0=71(x), r1=193(y), r2=110(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 193
LDI r2, 110
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
