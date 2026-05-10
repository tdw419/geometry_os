; DESCRIPTION: Renders a cyan box of size 111x92 starting at (274, 70).
; PLAN: r0=274(x), r1=70(y), r2=111(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 70
LDI r2, 111
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
