; DESCRIPTION: Renders a cyan box of size 51x40 starting at (257, 162).
; PLAN: r0=257(x), r1=162(y), r2=51(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 162
LDI r2, 51
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
