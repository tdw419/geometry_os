; DESCRIPTION: Renders a cyan box of size 52x100 starting at (125, 155).
; PLAN: r0=125(x), r1=155(y), r2=52(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 155
LDI r2, 52
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
