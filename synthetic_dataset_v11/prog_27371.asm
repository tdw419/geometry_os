; DESCRIPTION: Renders a cyan box of size 49x57 starting at (143, 127).
; PLAN: r0=143(x), r1=127(y), r2=49(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 127
LDI r2, 49
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
