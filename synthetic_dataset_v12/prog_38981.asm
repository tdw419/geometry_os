; DESCRIPTION: Renders a cyan box of size 106x12 starting at (144, 108).
; PLAN: r0=144(x), r1=108(y), r2=106(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 108
LDI r2, 106
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
