; DESCRIPTION: Renders a cyan box of size 111x55 starting at (36, 140).
; PLAN: r0=36(x), r1=140(y), r2=111(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 140
LDI r2, 111
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
