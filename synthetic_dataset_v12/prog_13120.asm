; DESCRIPTION: Places a yellow 117x38 rectangle at position (231, 197).
; PLAN: r0=231(x), r1=197(y), r2=117(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 197
LDI r2, 117
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
