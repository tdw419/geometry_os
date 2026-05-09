; DESCRIPTION: Renders a cyan box of size 65x39 starting at (86, 110).
; PLAN: r0=86(x), r1=110(y), r2=65(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 110
LDI r2, 65
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
