; DESCRIPTION: Renders a cyan box of size 49x92 starting at (197, 145).
; PLAN: r0=197(x), r1=145(y), r2=49(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 145
LDI r2, 49
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
