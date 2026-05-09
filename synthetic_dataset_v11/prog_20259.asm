; DESCRIPTION: Renders a cyan box of size 19x117 starting at (166, 83).
; PLAN: r0=166(x), r1=83(y), r2=19(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 83
LDI r2, 19
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
