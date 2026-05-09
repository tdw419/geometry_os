; DESCRIPTION: Places a green 37x71 rectangle at position (63, 125).
; PLAN: r0=63(x), r1=125(y), r2=37(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 125
LDI r2, 37
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
