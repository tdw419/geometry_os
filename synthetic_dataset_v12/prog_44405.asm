; DESCRIPTION: Renders a cyan box of size 74x26 starting at (349, 5).
; PLAN: r0=349(x), r1=5(y), r2=74(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 5
LDI r2, 74
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
