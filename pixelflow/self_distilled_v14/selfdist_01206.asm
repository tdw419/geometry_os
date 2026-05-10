; DESCRIPTION: Places a green 65x117 box at position (206, 181).
; PLAN: r0=206(x), r1=181(y), r2=65(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 181
LDI r2, 65
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
