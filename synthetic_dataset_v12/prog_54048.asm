; DESCRIPTION: Renders a cyan box of size 20x51 starting at (457, 142).
; PLAN: r0=457(x), r1=142(y), r2=20(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 142
LDI r2, 20
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
