; DESCRIPTION: Places a green 95x71 box at position (45, 165).
; PLAN: r0=45(x), r1=165(y), r2=95(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 165
LDI r2, 95
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
