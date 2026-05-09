; DESCRIPTION: Places a green 92x44 rectangle at position (121, 106).
; PLAN: r0=121(x), r1=106(y), r2=92(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 106
LDI r2, 92
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
