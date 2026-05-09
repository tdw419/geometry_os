; DESCRIPTION: Renders a cyan box of size 92x98 starting at (5, 81).
; PLAN: r0=5(x), r1=81(y), r2=92(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 81
LDI r2, 92
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
