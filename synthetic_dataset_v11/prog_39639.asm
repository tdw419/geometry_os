; DESCRIPTION: Places a green 77x75 rectangle at position (126, 117).
; PLAN: r0=126(x), r1=117(y), r2=77(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 117
LDI r2, 77
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
