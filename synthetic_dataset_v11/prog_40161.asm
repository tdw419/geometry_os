; DESCRIPTION: Renders a cyan box of size 26x26 starting at (199, 127).
; PLAN: r0=199(x), r1=127(y), r2=26(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 127
LDI r2, 26
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
