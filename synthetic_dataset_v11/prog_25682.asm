; DESCRIPTION: Places a yellow 72x21 rectangle at position (139, 38).
; PLAN: r0=139(x), r1=38(y), r2=72(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 38
LDI r2, 72
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
