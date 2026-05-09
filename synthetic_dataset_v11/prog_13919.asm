; DESCRIPTION: Renders a cyan box of size 44x96 starting at (182, 132).
; PLAN: r0=182(x), r1=132(y), r2=44(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 132
LDI r2, 44
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
