; DESCRIPTION: Renders a cyan box of size 86x99 starting at (278, 52).
; PLAN: r0=278(x), r1=52(y), r2=86(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 52
LDI r2, 86
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
