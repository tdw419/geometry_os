; DESCRIPTION: Places a green 78x11 rectangle at position (149, 186).
; PLAN: r0=149(x), r1=186(y), r2=78(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 186
LDI r2, 78
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
