; DESCRIPTION: Renders a cyan box of size 53x23 starting at (178, 0).
; PLAN: r0=178(x), r1=0(y), r2=53(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 0
LDI r2, 53
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
