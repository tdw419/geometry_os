; DESCRIPTION: Places a black 48x94 rectangle at position (215, 125).
; PLAN: r0=215(x), r1=125(y), r2=48(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 125
LDI r2, 48
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
