; DESCRIPTION: Renders a cyan box of size 58x55 starting at (367, 78).
; PLAN: r0=367(x), r1=78(y), r2=58(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 78
LDI r2, 58
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
