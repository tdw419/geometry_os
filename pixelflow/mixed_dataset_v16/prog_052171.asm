; DESCRIPTION: Renders a cyan box of size 13x52 starting at (471, 85).
; PLAN: r0=471(x), r1=85(y), r2=13(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 85
LDI r2, 13
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
