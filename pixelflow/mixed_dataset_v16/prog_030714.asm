; DESCRIPTION: Places a yellow 111x35 rectangle at position (81, 16).
; PLAN: r0=81(x), r1=16(y), r2=111(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 16
LDI r2, 111
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
