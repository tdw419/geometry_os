; DESCRIPTION: Renders a cyan box of size 40x19 starting at (411, 81).
; PLAN: r0=411(x), r1=81(y), r2=40(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 81
LDI r2, 40
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
