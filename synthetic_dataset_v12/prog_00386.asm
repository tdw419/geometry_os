; DESCRIPTION: Places a green 111x48 rectangle at position (212, 131).
; PLAN: r0=212(x), r1=131(y), r2=111(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 131
LDI r2, 111
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
