; DESCRIPTION: Places a yellow 62x18 rectangle at position (404, 13).
; PLAN: r0=404(x), r1=13(y), r2=62(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 13
LDI r2, 62
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
