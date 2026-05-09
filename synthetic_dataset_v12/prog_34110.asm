; DESCRIPTION: Places a green 92x106 rectangle at position (394, 66).
; PLAN: r0=394(x), r1=66(y), r2=92(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 66
LDI r2, 92
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
