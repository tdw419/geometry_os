; DESCRIPTION: Places a yellow 83x99 rectangle at position (225, 38).
; PLAN: r0=225(x), r1=38(y), r2=83(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 38
LDI r2, 83
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
