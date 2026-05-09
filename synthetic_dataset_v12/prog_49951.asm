; DESCRIPTION: Places a cyan 99x104 rectangle at position (94, 125).
; PLAN: r0=94(x), r1=125(y), r2=99(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 125
LDI r2, 99
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
