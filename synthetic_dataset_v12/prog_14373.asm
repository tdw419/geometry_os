; DESCRIPTION: Places a green 23x78 rectangle at position (298, 125).
; PLAN: r0=298(x), r1=125(y), r2=23(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 125
LDI r2, 23
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
