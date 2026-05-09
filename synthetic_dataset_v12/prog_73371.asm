; DESCRIPTION: Renders a green box of size 89x74 starting at (383, 82).
; PLAN: r0=383(x), r1=82(y), r2=89(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 82
LDI r2, 89
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
