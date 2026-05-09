; DESCRIPTION: Renders a cyan box of size 51x88 starting at (16, 89).
; PLAN: r0=16(x), r1=89(y), r2=51(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 89
LDI r2, 51
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
