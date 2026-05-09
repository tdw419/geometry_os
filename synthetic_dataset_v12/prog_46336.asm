; DESCRIPTION: Places a green 112x10 rectangle at position (215, 102).
; PLAN: r0=215(x), r1=102(y), r2=112(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 102
LDI r2, 112
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
