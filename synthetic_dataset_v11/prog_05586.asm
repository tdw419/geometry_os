; DESCRIPTION: Renders a cyan box of size 48x63 starting at (9, 149).
; PLAN: r0=9(x), r1=149(y), r2=48(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 149
LDI r2, 48
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
