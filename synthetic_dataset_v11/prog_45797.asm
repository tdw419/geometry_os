; DESCRIPTION: Renders a cyan box of size 96x51 starting at (60, 61).
; PLAN: r0=60(x), r1=61(y), r2=96(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 61
LDI r2, 96
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
