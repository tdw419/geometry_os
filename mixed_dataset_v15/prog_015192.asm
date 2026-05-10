; DESCRIPTION: Renders a cyan box of size 47x19 starting at (89, 53).
; PLAN: r0=89(x), r1=53(y), r2=47(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 53
LDI r2, 47
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
