; DESCRIPTION: Renders a cyan box of size 99x52 starting at (324, 102).
; PLAN: r0=324(x), r1=102(y), r2=99(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 102
LDI r2, 99
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
