; DESCRIPTION: Places a green 21x22 rectangle at position (68, 117).
; PLAN: r0=68(x), r1=117(y), r2=21(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 117
LDI r2, 21
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
