; DESCRIPTION: Renders a cyan box of size 65x111 starting at (131, 43).
; PLAN: r0=131(x), r1=43(y), r2=65(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 43
LDI r2, 65
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
