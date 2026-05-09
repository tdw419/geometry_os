; DESCRIPTION: Renders a green box of size 83x95 starting at (218, 156).
; PLAN: r0=218(x), r1=156(y), r2=83(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 156
LDI r2, 83
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
