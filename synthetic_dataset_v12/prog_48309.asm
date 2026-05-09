; DESCRIPTION: Places a yellow 111x100 rectangle at position (100, 80).
; PLAN: r0=100(x), r1=80(y), r2=111(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 80
LDI r2, 111
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
