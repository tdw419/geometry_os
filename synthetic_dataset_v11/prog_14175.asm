; DESCRIPTION: Renders a cyan box of size 61x26 starting at (106, 9).
; PLAN: r0=106(x), r1=9(y), r2=61(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 9
LDI r2, 61
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
