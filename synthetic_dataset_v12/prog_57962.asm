; DESCRIPTION: Renders a cyan box of size 74x117 starting at (352, 71).
; PLAN: r0=352(x), r1=71(y), r2=74(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 71
LDI r2, 74
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
