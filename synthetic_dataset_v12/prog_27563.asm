; DESCRIPTION: Renders a cyan box of size 109x77 starting at (19, 0).
; PLAN: r0=19(x), r1=0(y), r2=109(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 0
LDI r2, 109
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
