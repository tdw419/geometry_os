; DESCRIPTION: Renders a cyan box of size 55x70 starting at (399, 99).
; PLAN: r0=399(x), r1=99(y), r2=55(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 99
LDI r2, 55
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
