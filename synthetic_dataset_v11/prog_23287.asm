; DESCRIPTION: Places a green 102x78 rectangle at position (32, 169).
; PLAN: r0=32(x), r1=169(y), r2=102(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 169
LDI r2, 102
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
