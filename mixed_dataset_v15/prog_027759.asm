; DESCRIPTION: Renders a cyan box of size 49x106 starting at (160, 33).
; PLAN: r0=160(x), r1=33(y), r2=49(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 33
LDI r2, 49
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
