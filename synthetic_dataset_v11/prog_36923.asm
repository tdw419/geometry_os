; DESCRIPTION: Places a yellow 75x111 rectangle at position (98, 35).
; PLAN: r0=98(x), r1=35(y), r2=75(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 35
LDI r2, 75
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
