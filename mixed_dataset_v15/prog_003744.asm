; DESCRIPTION: Renders a cyan box of size 49x74 starting at (164, 132).
; PLAN: r0=164(x), r1=132(y), r2=49(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 132
LDI r2, 49
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
