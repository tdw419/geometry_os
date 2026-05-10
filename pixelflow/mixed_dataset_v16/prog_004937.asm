; DESCRIPTION: Renders a cyan box of size 52x14 starting at (172, 13).
; PLAN: r0=172(x), r1=13(y), r2=52(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 13
LDI r2, 52
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
