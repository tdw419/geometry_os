; DESCRIPTION: Renders a cyan box of size 119x79 starting at (111, 131).
; PLAN: r0=111(x), r1=131(y), r2=119(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 131
LDI r2, 119
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
