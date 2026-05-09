; DESCRIPTION: Places a green 94x43 rectangle at position (111, 156).
; PLAN: r0=111(x), r1=156(y), r2=94(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 156
LDI r2, 94
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
