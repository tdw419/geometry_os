; DESCRIPTION: Renders a cyan box of size 105x109 starting at (272, 58).
; PLAN: r0=272(x), r1=58(y), r2=105(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 58
LDI r2, 105
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
