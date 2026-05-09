; DESCRIPTION: Renders a cyan box of size 53x25 starting at (265, 20).
; PLAN: r0=265(x), r1=20(y), r2=53(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 20
LDI r2, 53
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
