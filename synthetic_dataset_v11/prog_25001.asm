; DESCRIPTION: Renders a cyan box of size 25x74 starting at (194, 127).
; PLAN: r0=194(x), r1=127(y), r2=25(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 127
LDI r2, 25
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
