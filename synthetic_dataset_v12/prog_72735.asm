; DESCRIPTION: Renders a cyan box of size 64x53 starting at (130, 141).
; PLAN: r0=130(x), r1=141(y), r2=64(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 141
LDI r2, 64
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
