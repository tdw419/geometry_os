; DESCRIPTION: Places a green 83x67 rectangle at position (70, 117).
; PLAN: r0=70(x), r1=117(y), r2=83(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 117
LDI r2, 83
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
