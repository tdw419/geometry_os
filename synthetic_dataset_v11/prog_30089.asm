; DESCRIPTION: Renders a cyan box of size 19x56 starting at (59, 159).
; PLAN: r0=59(x), r1=159(y), r2=19(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 159
LDI r2, 19
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
