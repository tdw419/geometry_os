; DESCRIPTION: Renders a cyan box of size 115x110 starting at (36, 2).
; PLAN: r0=36(x), r1=2(y), r2=115(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 2
LDI r2, 115
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
