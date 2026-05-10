; DESCRIPTION: Creates a green filled rectangle of size 82x21 starting at (144, 38).
; PLAN: r0=144(x), r1=38(y), r2=82(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 38
LDI r2, 82
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
