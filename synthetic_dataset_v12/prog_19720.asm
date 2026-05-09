; DESCRIPTION: Renders a cyan box of size 109x84 starting at (308, 54).
; PLAN: r0=308(x), r1=54(y), r2=109(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 54
LDI r2, 109
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
