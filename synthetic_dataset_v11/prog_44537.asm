; DESCRIPTION: Places a green 92x39 rectangle at position (73, 156).
; PLAN: r0=73(x), r1=156(y), r2=92(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 156
LDI r2, 92
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
