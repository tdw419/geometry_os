; DESCRIPTION: Places a green 54x98 rectangle at position (331, 117).
; PLAN: r0=331(x), r1=117(y), r2=54(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 117
LDI r2, 54
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
