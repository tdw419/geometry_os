; DESCRIPTION: Renders a cyan box of size 55x52 starting at (56, 145).
; PLAN: r0=56(x), r1=145(y), r2=55(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 145
LDI r2, 55
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
