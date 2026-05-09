; DESCRIPTION: Renders a cyan box of size 118x61 starting at (126, 101).
; PLAN: r0=126(x), r1=101(y), r2=118(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 101
LDI r2, 118
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
