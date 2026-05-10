; DESCRIPTION: Renders a cyan box of size 74x57 starting at (38, 90).
; PLAN: r0=38(x), r1=90(y), r2=74(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 90
LDI r2, 74
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
