; DESCRIPTION: Renders a cyan box of size 55x45 starting at (84, 148).
; PLAN: r0=84(x), r1=148(y), r2=55(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 148
LDI r2, 55
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
