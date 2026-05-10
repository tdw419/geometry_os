; DESCRIPTION: Renders a black box of size 90x98 starting at (410, 66).
; PLAN: r0=410(x), r1=66(y), r2=90(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 66
LDI r2, 90
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
