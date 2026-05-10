; DESCRIPTION: Renders a cyan box of size 52x100 starting at (423, 116).
; PLAN: r0=423(x), r1=116(y), r2=52(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 116
LDI r2, 52
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
