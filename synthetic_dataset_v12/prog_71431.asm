; DESCRIPTION: Places a yellow 83x16 rectangle at position (406, 5).
; PLAN: r0=406(x), r1=5(y), r2=83(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 5
LDI r2, 83
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
