; DESCRIPTION: Renders a cyan box of size 57x93 starting at (51, 85).
; PLAN: r0=51(x), r1=85(y), r2=57(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 85
LDI r2, 57
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
