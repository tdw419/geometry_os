; DESCRIPTION: Renders a green box of size 39x46 starting at (143, 131).
; PLAN: r0=143(x), r1=131(y), r2=39(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 131
LDI r2, 39
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
