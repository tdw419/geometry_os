; DESCRIPTION: Renders a cyan box of size 111x115 starting at (1, 18).
; PLAN: r0=1(x), r1=18(y), r2=111(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 18
LDI r2, 111
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
