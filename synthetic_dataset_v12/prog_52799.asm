; DESCRIPTION: Renders a cyan box of size 82x84 starting at (55, 29).
; PLAN: r0=55(x), r1=29(y), r2=82(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 29
LDI r2, 82
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
