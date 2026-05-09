; DESCRIPTION: Renders a cyan box of size 55x72 starting at (111, 138).
; PLAN: r0=111(x), r1=138(y), r2=55(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 138
LDI r2, 55
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
