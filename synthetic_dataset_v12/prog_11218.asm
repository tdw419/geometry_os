; DESCRIPTION: Places a green 21x73 rectangle at position (295, 7).
; PLAN: r0=295(x), r1=7(y), r2=21(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 7
LDI r2, 21
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
