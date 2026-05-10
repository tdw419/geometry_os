; DESCRIPTION: Renders a cyan box of size 53x39 starting at (36, 69).
; PLAN: r0=36(x), r1=69(y), r2=53(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 69
LDI r2, 53
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
