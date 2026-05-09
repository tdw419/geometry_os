; DESCRIPTION: Places a green 22x71 rectangle at position (13, 177).
; PLAN: r0=13(x), r1=177(y), r2=22(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 177
LDI r2, 22
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
