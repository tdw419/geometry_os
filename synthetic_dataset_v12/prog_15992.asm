; DESCRIPTION: Renders a cyan box of size 80x17 starting at (99, 27).
; PLAN: r0=99(x), r1=27(y), r2=80(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 27
LDI r2, 80
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
