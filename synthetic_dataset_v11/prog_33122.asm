; DESCRIPTION: Renders a cyan box of size 99x60 starting at (14, 52).
; PLAN: r0=14(x), r1=52(y), r2=99(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 52
LDI r2, 99
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
