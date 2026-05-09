; DESCRIPTION: Renders a cyan box of size 98x15 starting at (98, 64).
; PLAN: r0=98(x), r1=64(y), r2=98(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 64
LDI r2, 98
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
