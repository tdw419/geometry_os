; DESCRIPTION: Renders a cyan box of size 54x15 starting at (96, 17).
; PLAN: r0=96(x), r1=17(y), r2=54(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 17
LDI r2, 54
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
