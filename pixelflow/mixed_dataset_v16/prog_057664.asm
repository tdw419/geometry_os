; DESCRIPTION: Renders a cyan box of size 56x81 starting at (11, 131).
; PLAN: r0=11(x), r1=131(y), r2=56(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 131
LDI r2, 56
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
