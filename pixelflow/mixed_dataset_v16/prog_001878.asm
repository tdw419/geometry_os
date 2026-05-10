; DESCRIPTION: Places a yellow 33x13 rectangle at position (479, 230).
; PLAN: r0=479(x), r1=230(y), r2=33(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 230
LDI r2, 33
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
