; DESCRIPTION: Places a cyan 35x84 rectangle at position (215, 127).
; PLAN: r0=215(x), r1=127(y), r2=35(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 127
LDI r2, 35
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
