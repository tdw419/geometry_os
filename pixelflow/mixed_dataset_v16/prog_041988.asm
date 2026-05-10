; DESCRIPTION: Places a yellow 99x84 rectangle at position (296, 6).
; PLAN: r0=296(x), r1=6(y), r2=99(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 6
LDI r2, 99
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
