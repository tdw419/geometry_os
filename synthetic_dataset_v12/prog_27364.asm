; DESCRIPTION: Renders a cyan box of size 36x97 starting at (339, 135).
; PLAN: r0=339(x), r1=135(y), r2=36(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 135
LDI r2, 36
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
