; DESCRIPTION: Renders a green box of size 83x56 starting at (218, 55).
; PLAN: r0=218(x), r1=55(y), r2=83(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 55
LDI r2, 83
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
