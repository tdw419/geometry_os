; DESCRIPTION: Renders a cyan box of size 14x90 starting at (55, 63).
; PLAN: r0=55(x), r1=63(y), r2=14(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 63
LDI r2, 14
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
