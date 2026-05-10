; DESCRIPTION: Renders a cyan box of size 43x56 starting at (19, 126).
; PLAN: r0=19(x), r1=126(y), r2=43(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 126
LDI r2, 43
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
