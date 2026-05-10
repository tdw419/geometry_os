; DESCRIPTION: Places a black 111x68 rectangle at position (395, 167).
; PLAN: r0=395(x), r1=167(y), r2=111(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 167
LDI r2, 111
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
