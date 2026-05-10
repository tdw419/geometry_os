; DESCRIPTION: Places a green 94x20 rectangle at position (111, 2).
; PLAN: r0=111(x), r1=2(y), r2=94(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 2
LDI r2, 94
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
