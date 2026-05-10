; DESCRIPTION: Places a green 46x62 rectangle at position (3, 164).
; PLAN: r0=3(x), r1=164(y), r2=46(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 164
LDI r2, 46
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
