; DESCRIPTION: Places a green 117x44 rectangle at position (333, 38).
; PLAN: r0=333(x), r1=38(y), r2=117(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 38
LDI r2, 117
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
