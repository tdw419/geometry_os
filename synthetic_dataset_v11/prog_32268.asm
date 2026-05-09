; DESCRIPTION: Places a green 34x48 rectangle at position (199, 191).
; PLAN: r0=199(x), r1=191(y), r2=34(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 191
LDI r2, 34
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
